# Inicializa Oh My Posh con el tema configurado
oh-my-posh init pwsh --config "$env:LOCALAPPDATA\Programs\oh-my-posh\themes\material.omp.json" | Invoke-Expression

# Función para verificar si es necesario actualizar Oh My Posh
function Update-OhMyPoshIfNeeded {
    # Obtener la versión actual de Oh My Posh
    $currentVersion = oh-my-posh --version

    # Obtener la última versión desde la API de GitHub
    $latestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest"
    $latestVersion = $latestRelease.tag_name -replace '^v', ''  # Eliminar el prefijo 'v' de la versión

    # Comparar versiones
    if ($currentVersion -ne $latestVersion) {
	oh-my-posh upgrade --force
    }
}

# Función para obtener la IP pública
function my-ip {
    Invoke-RestMethod -Uri "https://api.ipify.org?format=json"
}

# Función para obtener la IP pública
function flushdns {
    Clear-DnsClientCache
}

# Test de conectividad mejorado
function ping-test($host = "google.com") {
    Test-Connection -ComputerName $host -Count 10
}

# Función para obtener la IP pública
function clear-caches {
    npm cache clean --force

    yarn cache clean

    # dotnet nuget locals all --clear

    # winget cache clean
}

# Limpiar archivos temporales
function cleanup {
    Write-Host "🧹 Limpiando archivos temporales..." -ForegroundColor Cyan
    
    # Temp folders
    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$env:USERPROFILE\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    
    # Recycle bin
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    
    Write-Host "✅ Limpieza completada" -ForegroundColor Green
}

# Función para ir a la bios
function go-bios {
    & "shutdown.exe" @("/r", "/fw", "/t", "1")
}

# Función para obtener la IP pública
function clear-history {
    $historyPath = (Get-PSReadLineOption).HistorySavePath
    notepad $historyPath
}

# Función para mostrar información del sistema de desarrollo
function Show-DevEnvironment {
    Write-Host "`n🔍 Información del Entorno de Desarrollo" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    
    # Show all dev tool versions
    $tools = @(
        @{Name="Node.js"; Command="node"; Args="-v"; Color="Green"; Icon="🟢"},
        @{Name="NPM"; Command="npm"; Args="--version"; Color="Red"; Icon="📦"},
        @{Name="Yarn"; Command="yarn"; Args="-v"; Color="Magenta"; Icon="🧶"},
        @{Name="fnm"; Command="fnm"; Args="--version"; Color="Yellow"; Icon="📦"},
        @{Name=".NET SDK"; Command="dotnet"; Args="--version"; Color="Blue"; Icon="🧰"},
        @{Name="Git"; Command="git"; Args="--version"; Color="DarkMagenta"; Icon="🔗"},
        @{Name="Python"; Command="python"; Args="--version"; Color="DarkYellow"; Icon="🐍"},
        @{Name="Oh My Posh"; Command="oh-my-posh"; Args="--version"; Color="DarkCyan"; Icon="🎨"}
    )
    
    foreach ($tool in $tools) {
        if (Get-Command $tool.Command -ErrorAction SilentlyContinue) {
            try {
                $version = & $tool.Command $tool.Args 2>$null
                if ($version) {
                    Write-Host "$($tool.Icon) $($tool.Name): $version" -ForegroundColor $tool.Color
                }
            }
            catch {
                Write-Host "❌ $($tool.Name): Error obteniendo versión" -ForegroundColor Red
            }
        } else {
            Write-Host "❌ $($tool.Name): No disponible" -ForegroundColor DarkRed
        }
    }
    
    Write-Host "`n"
}

# Importa el módulo de íconos de terminal
Import-Module -Name Terminal-Icons

# Configuración de PSReadLine para mostrar predicciones en estilo de lista
Set-PSReadLineOption -PredictionViewStyle ListView

# Configuración de fnm (Fast Node Manager) para usar en cada cambio de directorio
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

# Carga el perfil de Chocolatey si existe
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Mostrar información del entorno
Show-DevEnvironment

# Llama a la función para verificar y actualizar Oh My Posh si es necesario
Update-OhMyPoshIfNeeded


