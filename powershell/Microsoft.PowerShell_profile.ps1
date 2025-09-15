# Inicializa Oh My Posh con el tema configurado
oh-my-posh init pwsh --config 'C:/Users/Dan Marquez/AppData/Local/Programs/oh-my-posh/themes/material.omp.json' | Invoke-Expression

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

# Llama a la función para verificar y actualizar Oh My Posh si es necesario
Update-OhMyPoshIfNeeded

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

# Función para obtener la IP pública
function my-ip {
    Invoke-RestMethod -Uri "https://api.ipify.org?format=json"
}

function flushdns {
    Clear-DnsClientCache
}

function clear-caches {
    npm cache clean --force

    yarn cache clean

    # dotnet nuget locals all --clear

    # winget cache clean
}

Write-Host "`n🚀 Iniciando entorno de desarrollo..." -ForegroundColor Cyan

# Mostrar versión de fnm
try {
    $fnmVersion = fnm --version
    Write-Host "📦 fnm activo: $fnmVersion" -ForegroundColor Yellow
} catch {
    Write-Host "❌ fnm no está disponible" -ForegroundColor Red
}

# Mostrar versión de Node.js
try {
    $nodeVersion = node -v
    Write-Host "🟢 Node.js activo: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js no está disponible (¿faltó 'fnm use' o fnm env?)" -ForegroundColor Red
}

# Mostrar versión de Yarn
try {
    $yarnVersion = yarn -v
    Write-Host "🧶 Yarn activo: $yarnVersion" -ForegroundColor Magenta
} catch {
    Write-Host "⚠️ Yarn no está disponible" -ForegroundColor DarkRed
}

# Mostrar versión de .NET SDK
try {
    $dotnetVersion = dotnet --version
    Write-Host "🧰 .NET SDK activo: $dotnetVersion" -ForegroundColor Blue
} catch {
    Write-Host "❌ .NET SDK no encontrado" -ForegroundColor Red
}

# Mostrar versión de Oh My Posh
try {
    $ompVersion = oh-my-posh --version
    Write-Host "🎨 Oh My Posh versión: $ompVersion" -ForegroundColor DarkCyan
} catch {
    Write-Host "⚠️ Oh My Posh no está disponible" -ForegroundColor DarkRed
}

Write-Host "✅ Entorno inicializado correctamente.`n" -ForegroundColor Cyan
