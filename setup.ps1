# cursor-stack setup — copy skills to ~/.cursor/skills/
$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsDir = if ($env:CURSOR_SKILLS_DIR) { $env:CURSOR_SKILLS_DIR } else { Join-Path $env:USERPROFILE ".cursor\skills" }

Write-Host "cursor-stack setup"
Write-Host "  Source: $ScriptDir"
Write-Host "  Target: $SkillsDir"
Write-Host ""

if (-not (Test-Path $SkillsDir)) {
    New-Item -ItemType Directory -Path $SkillsDir -Force | Out-Null
}

$skills = @("plan-ceo", "plan-eng", "code-review", "ship", "qa", "retro")
foreach ($skill in $skills) {
    $skillPath = Join-Path $ScriptDir $skill
    $skillMd = Join-Path $skillPath "SKILL.md"
    if ((Test-Path $skillPath) -and (Test-Path $skillMd)) {
        Copy-Item -Path $skillPath -Destination $SkillsDir -Recurse -Force
        Write-Host "  Installed: $skill"
    }
}

Write-Host ""
Write-Host "Done. Restart Cursor or open a new chat to use the skills."
Write-Host ""
Write-Host "Try: /plan-ceo, /plan-eng, /review, /ship, /qa, /retro"
