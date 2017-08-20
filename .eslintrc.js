module.exports = {
    "env": {
        "es6": true,
        "node": true,
        "browser": true,
    },
    "globals": {
        "define": true,
        "it": true
    },
    "parserOptions": {
        "ecmaVersion": 6,
        "sourceType": "module",
        "ecmaFeatures": {
            "jsx": true
        }
    },
    "plugins": ["react"],
    "settings": {
        "react": {
            "createClass": "createClass",
            "pragma": "React",
            "version": "15.0"
        }
    },
    "extends": ["airbnb-base", "plugin:react/recommended"],
    "parser": "babel-eslint",
    "rules": {
        "no-multiple-empty-lines": [
            "error",
            {
                "max": 1
            }
        ],
        "import/no-dynamic-require": [
            0
        ],
        "comma-dangle": [
            "error",
            {
                "arrays": "always-multiline",
                "objects": "always-multiline",
                "imports": "always-multiline",
                "exports": "always-multiline",
                "functions": "never"
            }
        ],
        "no-underscore-dangle": [
            0,
            {
                "allowAfterThis": true,
                "allowAfterSuper": true
            }
        ],
        "import/no-extraneous-dependencies": [
            "error",
            {
                "devDependencies": true
            }
        ],
        "no-param-reassign": [
            0
        ],
        "object-shorthand": [
            "warn"
        ],
        "arrow-body-style": [
            "warn",
            "always"
        ],
        "indent": [
            "error",
            4,
            {
                SwitchCase: 1
            }
        ],
        "quotes": [
            "warn",
            "single"
        ],
        "no-console": [
            "warn"
        ],
        "linebreak-style": [
            0
        ],
        "semi": [
            "error",
            "always"
        ],
        "max-len": [
            0,
            80,
            4
        ]
    }
};
