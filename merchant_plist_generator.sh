
#!/bin/bash
appInfoPlistPath="Jovi/Jovi/Info.plist"
bundleShortVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" ${appInfoPlistPath})
bundleVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" ${appInfoPlistPath})

url="$1"
if [ "$1"  = "" ]
then 
	url="http://app.dp:8080/view/Merchant/job/dpmerchant_adhocMCI/lastBuild/buildNumber"
fi
result=""
while [ "$result" == "" ]
do 
    result=$(curl -s "$url")
done

newBundleVersion=""$bundleShortVersion"."$result""
/usr/libexec/PlistBuddy -c "Set CFBundleVersion ${newBundleVersion}"  ${appInfoPlistPath}

sh merchant-icon-generator.sh "1024-origin.png" "$bundleShortVersion" "$result"






