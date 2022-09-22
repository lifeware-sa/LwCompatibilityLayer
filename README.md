# LwCompatibilityLayer

[![GitHub Workflow Status][github_action_b]][github_action_url]
[![Coverage Status][coverage_status_b]][coverage_status_url]
[![License][license_b]][license_url]

Class stubs to fix dependency issues of open sourced Lifeware packages

Don't manually load this project! It's automatically loaded as dependency

## Why a compatibility layer?

To make open-sourced Lifeware code compatible with outside world, we are using two mechanisms:
1. Change source code locally before comitting to remove closed-source dependencies
2. Have a compatibility layer as dependency when a rewrite would be too complex

[github_action_b]: https://img.shields.io/github/workflow/status/lifeware-sa/LwCompatibilityLayer/smalltalkCI/master
[github_action_url]: https://github.com/lifeware-sa/LwCompatibilityLayer/actions
[coverage_status_b]: https://coveralls.io/repos/github/lifeware-sa/LwCompatibilityLayer/badge.svg?branch=master
[coverage_status_url]: https://coveralls.io/github/lifeware-sa/LwCompatibilityLayer?branch=master
[license_b]: https://img.shields.io/github/license/lifeware-sa/LwCompatibilityLayer
[license_url]: LICENSE
