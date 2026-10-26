<# Exemple adapté du projet ArchiTech. Copie uniquement ; aucune suppression de rétention.
Exécuter sous une identité ayant accès aux chemins explicitement fournis. #>
[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)][string[]]$Source,
    [Parameter(Mandatory)][string]$Destination
)
$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $Destination -PathType Container)) {
    throw 'La destination doit être un dossier existant.'
}
$destinationRoot = (Resolve-Path -LiteralPath $Destination).ProviderPath.TrimEnd('\')
$resolvedSources = @()
foreach ($item in $Source) {
    if (-not (Test-Path -LiteralPath $item -PathType Container)) {
        throw "Source absente : $item"
    }
    $resolved = (Resolve-Path -LiteralPath $item).ProviderPath.TrimEnd('\')
    if ($destinationRoot -eq $resolved -or $destinationRoot.StartsWith($resolved + '\', [StringComparison]::OrdinalIgnoreCase)) {
        throw 'La destination ne doit pas être dans une source.'
    }
    $resolvedSources += $resolved
}
$run = Join-Path $destinationRoot ((Get-Date -Format 'yyyyMMdd-HHmmss') + '-' + [guid]::NewGuid().ToString('N'))
if ($PSCmdlet.ShouldProcess($run, 'Créer une copie de sauvegarde')) {
    New-Item -ItemType Directory -Path $run | Out-Null
    for ($index = 0; $index -lt $resolvedSources.Count; $index++) {
        $target = Join-Path $run ('source-' + $index)
        Copy-Item -LiteralPath $resolvedSources[$index] -Destination $target -Recurse -Force -ErrorAction Stop
    }
    Write-Output "Copie terminée : $run"
}
