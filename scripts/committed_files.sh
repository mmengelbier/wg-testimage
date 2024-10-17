#! /bin/bash
#
# returns a space delimited list of files included in the current commit
#
# commit identified by GITHUB_SHA
# 

# -- identify commiit
echo "Processing commit ${GITHUB_SHA}"


# -- verify we have a GitHub action token set
# note: GITHUB_TOKEN mapped to ACTION_TOKEN in workflow

if [[ -z "${ACTION_TOKEN}" ]]; then
   echo "GitHub token not set"
   exit 1
fi


# -- get commit
COMMIT=$( curl -sS -L \
                -H "Accept: application/vnd.github+json" \
                -H "Authorization: Bearer ${ACTION_TOKEN}" \
                -H "X-GitHub-Api-Version: 2022-11-28" \
                https://api.github.com/repos/${GITHUB_REPOSITORY}/commits/${GITHUB_SHA} )

# -- identify files
FILES=$( echo "$COMMIT" | \
         jq -r '.files | .[] | .filename' | \
         tr '\n' ' ' )

echo "${FILES}"

