# LwCompatibilityLayer

Class stubs to fix dependency issues of open sourced Lifeware packages

Don't manually load this project! It's automatically loaded as dependency

## Why a compatibility layer?

To make open-sourced Lifeware code compatible with outside world, we are using two mechanisms:
1. Change source code locally before comitting to remove closed-source dependencies
2. Have a compatibility layer as dependency when a rewrite would be too complex
