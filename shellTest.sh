
#!/bin/bash
appInfoPlistPath="/Users/Jack/Code/shell/Jovi/Jovi-Info-AdHoc.plist"
bundleShortVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" ${appInfoPlistPath})
bundleVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" ${appInfoPlistPath})

result=""
while [ "$result" == "" ]
do 
    result=$(curl -s 'http://app.dp:8080/view/Merchant/job/dpmerchant_adhocMCI/lastBuild/buildNumber')
done

newBundleVersion=""$bundleShortVersion"."$result""
/usr/libexec/PlistBuddy -c "Set CFBundleVersion ${newBundleVersion}"  ${appInfoPlistPath}

sh merchant-icon-generator.sh "1024-origin.png" "$bundleShortVersion" "$result"






