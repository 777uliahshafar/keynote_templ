$path = "."
$fileTypes = ".*.jpg|.*.bmp|.*.png|.*.gif|.*.tif"
$files = Get-ChildItem -Recurse | Where-Object FullName -Match ".*$path*"
$counter = 1
$dir = ""

foreach ($file in $files) {
    $name = $file.Name
    $fullname = $file.FullName
    $extension = $file.Extension

    if ($name -Match $fileTypes) {
        if ($dir -ne $file.Directory.Name) {
            $dir = $file.Directory.Name
            $counter = 1
        }

        $zero = If ( $counter -le 9) { "0" } Else { "" }

        Rename-Item $fullname "$zero$counter-$dir$extension"

        $counter++
    }
}
