const uaup = require('uaup-js')

const defaultStages = {
  Checking: "Checking...",
  Found: "Update Found!",
  NotFound: "No Update Found.",
  Downloading: "Downloading...",
  Unzipping: "Installing...",
  Cleaning: "Finalizing...",
  Launch: "Launching..."
}

const updateOptions = {
  gitRepo: '',
  getUsername: '',

  appName: 'sog-launcher',
  appExecutableName: 'sog-launcher.exe',

  progressBar: document.getElementById('progress-bar'),
  label: document.getElementById('progress-label'),
  stageTitles: defaultStages
}

uaup.Update(updateOptions)