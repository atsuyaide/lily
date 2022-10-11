# Encoding UTF-8 with BOM
#=# als
#=#  Displays a list of aliases that are registered in doskey

pdoskey /macros | sort | ForEach-Object { $_ -replace ";#=#(.*?)$", ""}