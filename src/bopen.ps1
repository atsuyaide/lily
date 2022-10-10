#=# bopen
#=#  引数として渡されたURLを$Env.DefaultBrowserで開きます.
foreach($uri in $args) {
    start $Global:DefaultBrowser $uri
}