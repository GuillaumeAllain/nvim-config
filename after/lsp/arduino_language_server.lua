return {
    cmd = { "arduino-language-server", "-cli-config", (os.getenv("ARDUINO_PATH") or ".") .. "/sketch.yaml" },
}
