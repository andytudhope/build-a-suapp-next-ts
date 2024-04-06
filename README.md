# Build a SUAPP Template

This repo will help you get started building a SUAPP with a modern frontend.

## Get Started

**We recommend using node v20.10.0 and npm v10.2.3**:

```bash
$ git clone --recurse-submodules git@github.com:andytudhope/build-a-suapp-next-ts.git suapp
$ cd suapp
$ yarn
```

You should now be able to compile (and deploy) your contract with:

```bash
$ yarn contracts:build 
```

If you need to get SUAVE, simply run:

```bash
curl -L https://suaveup.flashbots.net | bash
```

And start a local node with:

```bash
suave-geth --suave.dev --suave.eth.external-whitelist='*'
```

With SUAVE running locally,deploy your contracts with:

```bash
yarn contracts:deploy
```

Copy the deployed address in `packages/next/constants/addresses.tsx`.

Start the frontend with:

```bash
yarn fe:dev
```

## Notes

1. Confidential Compute Requests (CCRs) on SUAVE do not work with wallets that implement the EIP-1193 Javascript API. Therefore, we use the unsafe `eth_sign` method to sign CCRs, which does work, but requires that you enable this functionality in wallets like MetaMask.
    1. To do so in MetaMask, go to "Settings" -> "Advanced" -> scroll to bottom -> switch Eth_sign requests on.
2. This template assumes that you are running SUAVE locally and have your browser wallet connected to `localhost:8545`.
3. No tests are included in `forge`.
4. If you want to pirate ready-to-use typescript components for your frontend, we recommend you do so from [scaffold-eth2](https://github.com/scaffold-eth/scaffold-eth-2).