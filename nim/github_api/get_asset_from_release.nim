import
  httpclient,
  json,
  strformat,
  tables


proc main =
  const
    owner = ""
    repo = ""
    tag = ""
  let
    releaseUrl = fmt"https://api.github.com/repos/{owner}/{repo}/releases/tags/{tag}"
    assetsUrl = newHttpClient().getContent(releaseUrl).parseJson["assets_url"].getStr
    assetUrl = newHttpClient().getContent(assetsUrl).parseJson[0]["url"].getStr
    table = newTable({"Accept": @["application/octet-stream"]})
    headers = HttpHeaders(table: table)
    client = newHttpClient(headers=headers)
  client.downloadFile(assetUrl, "asset.zip")


when isMainModule:
  main()
