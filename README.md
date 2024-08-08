## Code editor based on Code-OSS (VS Code open source)

### Usage

This project can be used to build a browser-based code editor. It is a a thin wrapper around Code-OSS VS Code open source that enables it to be hosted in an iframe as part of a larger web application. The patches remove various features from the Code OSS codebase, such as the terminal, source control, and debugger, to create a more lightweight and focused code editing experience that can be embedded in a browser-based application.

The patched Code OSS codebase provides a powerful text editor with syntax highlighting, code folding, and other core code editing features. By [using a Proposed API](https://code.visualstudio.com/api/advanced-topics/using-proposed-api), you can integrate this editor into your browser-based application, allowing users to edit code directly within the browser.

Some key features and use cases for this patched Code OSS codebase include:

1. Browser-based Code Editing: Embed the patched Code OSS editor in a console-based application, allowing users to view, edit, and save code files directly from the command line.
2. Streamlined Interface: The removed features, such as the terminal, source control, and debugger, create a more focused and distraction-free code editing experience.
3. Customization: Utilize [the proposed extension APIs](https://code.visualstudio.com/api/advanced-topics/using-proposed-api#sharing-extensions-using-the-proposed-api) to further customize the editor, integrate it with your application's workflows, and add additional functionality as needed.
4. Portability: The web-based nature of the patched Code OSS codebase makes it easily portable and deployable in various browser-based environments.

## Patches Folder

The `patches` directory contains a set of patches that modify the behavior and functionality of the code editor. These patches range from adding a simpler workbench and a bridge between the extension host and grandparent process, to disabling online services, telemetry, and removing various features such as the terminal, SSH remote host, source control, debugger, and accounts/cloud sync. These patches are used to customize the experience for specific use cases or requirements, and are applied to the codebase using a provided script to ensure a consistent and reproducible patching process. 

The `patches` directory serves as a reference point for the reviewers, allowing them to compare the changes introduced by the patches against the original Code OSS codebase. Each patch is provided in the standard unified diff format, which includes the commit metadata (hash, author, date, and message) and the targeted changes. This helps streamline the review process and ensures that the modifications are easily understandable and verifiable.

## Patching Execution

This script is designed to help developers apply patches to the Code OSS codebase. It automates the process of cloning the repository, installing the necessary dependencies, and applying the provided patches.

### Prerequisites
- You need same prerequisites as [VS Code open source Prerequisites](https://github.com/microsoft/vscode/wiki/How-to-Contribute#prerequisites)
- `git` installed on the system.
- `yarn` installed on the system. You can install `yarn` by following the instructions on the [Yarn website](https://classic.yarnpkg.com/en/docs/install/).



Run this scipt:

```bash
sh ./scripts/install.sh
```

The script will start the patching process. Once completed, it will display the list of files changed by the applied patches.

The script performs the following steps:
1. Clones the Code OSS repository.
2. Applies the patches located in the patches directory.
3. Displays the list of files changed by the applied patches

## Building the Patched Code OSS

Once the patches have been applied, you can build the patched Code OSS codebase using `yarn` and `gulp`:

1. Install the project dependencies:
```
yarn
```

2. Build the minified the web version of VSCode:
```
yarn run gulp vscode-web-min
```
This command will use `gulp` task runner to build the minified web bundle for the patched Code OSS  codebase.

## Troubleshooting

If you encounter any issues while running the script or building the patched Code OSS, please check the output for any error messages and try to resolve them accordingly. If you need further assistance, feel free to open an issue in the repository.

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file.