$path = Resolve-Path .\json\json.jar | Select-String json
$path = $path -replace "\\","/"
$path = $path -replace "C:",""
write-output $path

$angrypuppy = Get-Content .\ANGRYPUPPY.cna
$angrypuppy -replace "{{PATH}}",$path | set-content .\ANGRYPUPPY.cna