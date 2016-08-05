#region Licence
<#
# Copyright 2016 Paul Broadwith
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#>
#endregion

#Requires -Version 2
Set-StrictMode -Version Latest

$VerbosePreference = "Continue"

$functions = get-childitem (Join-Path -Path $PSScriptRoot -ChildPath *.ps1) -recurse -exclude *.tests.ps1
foreach ($function in $functions) {
    . $function
}

Export-ModuleMember -Function *

$script:Config = @{
    Sources = @( "SubFolder" );
    ImageExtension = @("*.jpg", "*.jpeg", "*.png");
    SubFolder = @("C:\Users\Paul\Pictures\Wallpapers")
}

$sourceType = $script:Config.Sources | Get-Random
Write-Verbose "Selected source type: $sourceType"

switch ($sourceType) {
    "SubFolder" {      
        $source = $script:Config[$sourceType]
        Write-Verbose "Selected source : $source"
        $wallpaper = (Get-ChildItem -Path (Join-Path -Path $source -ChildPath "*.*") -Include $script:Config.ImageExtension -Recurse | Get-Random).FullName  
    } 
}

Set-Wallpaper $wallpaper stretch