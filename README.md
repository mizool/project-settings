# Correct setup for projects

1. `/.editorconfig` with EOL settings (for VSCode, IntelliJ and others) [overwrite]
2. `/.gitattributes` to disable EOL conversion on checkout/commit [merge if exists]
3. IntelliJ code style on project-level [overwrite]:
    - `/.idea/codeStyles/codeStyleConfig.xml`
    - `/.idea/codeStyles/Project.xml`
4. Ensure the IntelliJ files listed above are under version control, either by manually adding them despite gitignore rules or by using the following IntelliJ-related `.gitignore` rules:
    ```
    .idea/*
    !.idea/codeStyles
    !.idea/codeStyles/*
    *.iml
    ```

# Correct setup for developer machines

1. IntelliJ
    - enable editorconfig support
    - ensure project-level code styles are active 

# Changes to this repository

_TODO: describe_
