Download
# Create a folder
$ mkdir actions-runner && cd actions-runnerCopied!# Download the latest runner package
$ curl -o actions-runner-linux-x64-2.338.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.338.2/actions-runner-linux-x64-2.338.2.tar.gzCopied!# Optional: Validate the hash
$ echo "baebf204307bac6193480852732f0aba2ae97b6c5597c244f4d5558390147c40  actions-runner-linux-x64-2.338.2.tar.gz" | shasum -a 256 -cCopied!# Extract the installer
$ tar xzf ./actions-runner-linux-x64-2.338.2.tar.gzCopied!
Configure
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/ravikiranv097/cv --token BKXQ3YJZHXAAL6EBBC4DT6DK5JEU4Copied!# Last step, run it!
$ ./run.shCopied!
Using your self-hosted runner
# Use this YAML in your workflow file for each job
runs-on: self-hosted