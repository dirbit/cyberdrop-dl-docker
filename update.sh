#!/usr/bin/env bash

VERSION=$(curl -s https://pypi.org/pypi/cyberdrop-dl/json | jq -r .info.version)

if git describe --tags `git rev-list --tags --max-count=1` | grep -vq "$VERSION"; then
    echo "Updating to version $VERSION"
    sed -i "s/ENV VERSION .*/ENV VERSION $VERSION/g" Dockerfile
    git add Dockerfile

    git commit -m "version $VERSION"
    git tag "$VERSION"

    git push -u origin main
    git push -u origin "$VERSION"
else
    echo "No new version"
fi

