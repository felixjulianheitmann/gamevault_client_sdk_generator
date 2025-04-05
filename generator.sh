rm -r sdk/*
rm -r sdk/.dart_tool
rm -r sdk/.openapi-generator

echo "{
        \"spec\": $(cat gamevault_api.json),
        \"options\":{
            \"pubName\": \"gamevault_client_sdk\",
            \"pubVersion\": \"0.0.2\",
            \"pubHomepage\": \"https://github.com/felixjulianheitmann/gamevault_client_sdk.git\",
            \"pubDescription\": \"Just the auto-generated client sdk for the gamevault API\"
        }
    }" > request_body.json

RESPONSE=$(curl -X POST \
    -H "content-type:application/json" \
    -d @request_body.json  \
    https://api.openapi-generator.tech/api/gen/clients/dart)

rm request_body.json
cp gamevault_api.json sdk/spec.json

CODE=$(echo $RESPONSE | jq -r '.code')

wget -O api.zip "http://api.openapi-generator.tech/api/gen/download/${CODE}"
unzip api.zip

mv dart-client/* sdk
mv dart-client/.* sdk
rm -r dart-client
rm api.zip

python patch.py