/Applications/Unity/Unity.app/Contents/MacOS/Unity \
	-projectPath ./movie_flutter_unity \
	-executeMethod BuildClass.AppBuild \
	-batchmode \
	-quit \
	-logFile ./temp/log.txt


# echo -n "Tag name? "; read tagname
# git tag $tagname

# tmpdata=./temp/binary-release-$$.json
# cat <<EOF > $tmpdata
# {
# 	"tag_name": "$tagname",
# 	"target_commitish": "master",
# 	"name": "$tagname",
# 	"body": "release of binary version $tagname",
# 	"draft": false,
# 	"prerelease": false
# }
# EOF

# ret=$( curl -XPOST -d @"$tmpdata" https://api.github.com/repos/TakenokoTech/MovieFlutterApp/releases )
# uploadURL=$( echo $ret | jq -r .upload_url | sed "s/{?name}/?name=binary-$tagname.darwin-amd64.zip/" )

# echo "Upload URL: $uploadURL"

# ret2=$( curl -H "Authorization: token $GHE_TOKEN" \
# 	-H "Accept: application/vnd.github.manifold-preview" \
# 	-H "Content-Type: application/zip" \
# 	--data-binary @"$FILE_TO_UPLOAD" "$uploadURL"
# )

# echo "Result JSON:"
# echo $ret2 | jq .