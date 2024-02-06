# oele

~~Okta~~ Okay Expression Language Evaluator

## Goal

The goal of this project is to parse statements written in the Okta Expression Language for correctness. Since this is a WIP, it will just be an Okay expression language evaluator for now.

The parsing of the expression language is handled by [oele-grammar](https://github.com/mgarbacz/oele-grammar).

## Developing

Once you've cloned the project, install dependencies with `npm install` (or `pnpm install` or `yarn`). This project uses Vite to power local development and run builds. To start a development server:

```bash
npm run dev

# or start the server and open the app in a new browser tab
npm run dev -- --open
```

## Building

To create a production build:

```bash
npm run build
```

You can preview the production build with `npm run preview`.
