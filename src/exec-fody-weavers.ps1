﻿# Load additional assemblies needed by script_inner, then exec it.
Add-Type -AssemblyName Microsoft.Build.Framework;
$output = Invoke-Expression("& '$PSScriptRoot/exec-fody-weavers-inner.ps1' $args");
if ($output[$output.Length - 1] -ne '0') {
  Write-Host("Inner script returned nonzero result.");
  exit 1;
}