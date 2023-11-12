from robot.api.deco import keyword, library


@library
class BrowserHelper:
    @keyword
    def update_device_config(
        self,
        device_config: dict,
        resolution: str = "1920x1080",
    ) -> dict:
        width, height = resolution.split("x")
        width = int(width)
        height = int(height)
        device_config["screen"] = {
            "width": int(width),
            "height": int(height),
        }
        device_config["viewport"] = device_config.get("screen")
        return device_config

    @keyword
    def get_browser_context(self, resolution: str = "1920x1080", ignoredHTTPSErrors=False, jsEnabled=True) -> dict:
        """Get Browser Context Options

        Args:
            resolution (str, optional): viewport size. Defaults to "1920x1080".
            ignoredHTTPSErrors (bool, optional): ignore https errors or not. Defaults to False.
            jsEnabled (bool, optional): enabled javascript or not. Defaults to True.

        Returns:
            dict: browser context option
        """
        width, height = resolution.split("x")
        context = {
            "ignoreHTTPSErrors": ignoredHTTPSErrors,
            "javaScriptEnabled": jsEnabled,
            "viewport": {"width": int(width), "height": int(height)},
        }
        return context
