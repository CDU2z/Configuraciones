# ================================
# OH MY POSH INITIALIZATION
# ================================
oh-my-posh init pwsh --config "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\material.omp.json" | Invoke-Expression

# ================================
# AUTO UPDATE OH MY POSH (Safe)
# ================================
function Update-OhMyPoshIfNeeded {
    try {
        $currentVersion = oh-my-posh --version
        $latestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest" -TimeoutSec 3
        $latestVersion = $latestRelease.tag_name -replace '^v',''

        if ($currentVersion -ne $latestVersion) {
            oh-my-posh upgrade --force
        }
    } catch {}
}

# ================================
# NETWORK UTILITIES
# ================================
function my-ip {
    Invoke-RestMethod -Uri "https://api.ipify.org?format=json"
}

function flushdns {
    Clear-DnsClientCache
}

function ping-test($host = "google.com") {
    Test-Connection -ComputerName $host -Count 10
}

# ================================
# CACHE CLEANING
# ================================
function clear-caches {
    npm cache clean --force 2>$null
    yarn cache clean 2>$null
}

function cleanup {
    Write-Host "🧹 Limpiando archivos temporales..." -ForegroundColor Cyan
    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Write-Host "✅ Limpieza completada" -ForegroundColor Green
}

# ================================
# SYSTEM UTILITIES
# ================================
function go-bios {
    shutdown.exe /r /fw /t 1
}

function clear-history {
    notepad (Get-PSReadLineOption).HistorySavePath
}

# ================================
# DEVELOPMENT ENVIRONMENT STATUS
# ================================
function Show-DevEnvironment {

    Write-Host "`n🔍 Información del Entorno de Desarrollo" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan

    $tools = @(
        @{Name="Node.js"; Command="node"; Args="-v"; Color="Green"; Icon="🟢"},
        @{Name="NPM"; Command="npm"; Args="--version"; Color="Red"; Icon="📦"},
        @{Name="Yarn"; Command="yarn"; Args="-v"; Color="Magenta"; Icon="🧶"},
        @{Name="fnm"; Command="fnm"; Args="--version"; Color="Yellow"; Icon="📦"},
        @{Name=".NET SDK"; Command="dotnet"; Args="--version"; Color="Blue"; Icon="🧰"},
        @{Name="Git"; Command="git"; Args="--version"; Color="DarkMagenta"; Icon="🔗"},
        @{Name="Python"; Command="python"; Args="--version"; Color="DarkYellow"; Icon="🐍"},
        @{Name="Oh My Posh"; Command="oh-my-posh"; Args="--version"; Color="DarkCyan"; Icon="🎨"},
        @{Name="Docker"; Command="docker"; Args="--version"; Color="Cyan"; Icon="🐳"},
        @{Name="WSL"; Command="wsl"; Args="--version"; Color="White"; Icon="🐧"}
    )

    foreach ($tool in $tools) {
        if (Get-Command $tool.Command -ErrorAction SilentlyContinue) {
            try {
                $version = & $tool.Command $tool.Args 2>$null
                if ($version) {
                    Write-Host "$($tool.Icon) $($tool.Name): $version" -ForegroundColor $tool.Color
                }
            } catch {
                Write-Host "❌ $($tool.Name): Error obteniendo versión" -ForegroundColor Red
            }
        } else {
            Write-Host "❌ $($tool.Name): No disponible" -ForegroundColor DarkRed
        }
    }

    # Docker Engine Status
    if (Get-Command docker -ErrorAction SilentlyContinue) {
        try {
            docker info > $null 2>&1
            if ($LASTEXITCODE -eq 0) {
                Write-Host "🚀 Docker Engine: Running" -ForegroundColor Green
            } else {
                Write-Host "⚠️ Docker Engine: Installed but not running" -ForegroundColor Yellow
            }
        } catch {
            Write-Host "❌ Docker Engine: Error detecting status" -ForegroundColor Red
        }
    }

    # WSL Distros
    if (Get-Command wsl -ErrorAction SilentlyContinue) {
        try {
            $distros = wsl -l -v 2>$null
            if ($distros) {
                Write-Host "`n📦 WSL Distros:" -ForegroundColor Gray
                Write-Host $distros
            }
        } catch {}
    }

    Write-Host "`n"
}

# ================================
# MODULES
# ================================
Import-Module Terminal-Icons -ErrorAction SilentlyContinue

# ================================
# PSREADLINE CONFIG
# ================================
Set-PSReadLineOption -PredictionViewStyle ListView

# ================================
# FNM (Node Version Manager)
# ================================
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# ================================
# CHOCOLATEY PROFILE
# ================================
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path $ChocolateyProfile) {
    Import-Module $ChocolateyProfile
}

# ================================
# STARTUP EXECUTION
# ================================
Show-DevEnvironment
Update-OhMyPoshIfNeeded
