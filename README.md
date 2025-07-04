# Artemis for tvOS

[![Build tvOS](https://github.com/p1carats/artemis-tvos/actions/workflows/ci.yml/badge.svg)](https://github.com/p1carats/artemis-tvos/actions/workflows/ci.yml)

[Artemis for tvOS](https://github.com/p1carats/artemis-tvos) is an open source client for [Apollo](https://github.com/ClassicOldSong/Apollo), Sunshine, DuoStream, and other NVIDIA GameStream-compatible servers.

Originally forked from the [official Moonlight for iOS/tvOS app](https://github.com/moonlight-stream/moonlight-ios), Artemis lets you stream your full collection of games and apps from your powerful desktop PC to your Apple TV.

> Just like Artemis for Android, even though the project is based on Moonlight and supports Sunshine, the main focus is and will remain Apollo. Other servers are supported but may be less stable or fully featured. Over time, features might only work with Apollo, or even break on others. I recommend Apollo — it's more complete and actively maintained — but use what works best for you.

If you're looking for Android support, check out the [original Artemis Android client](https://github.com/ClassicOldSong/moonlight-android).

There’s no dedicated documentation/wiki yet, but for now you can refer to:
- [Moonlight Wiki](https://github.com/moonlight-stream/moonlight-docs/wiki) for general usage/setup/troubleshooting
- [Apollo Wiki](https://github.com/ClassicOldSong/Apollo/wiki) for server-specific features


## Key differences with upstream

Artemis is motivated by a personal need for tvOS-specific features and improvements (as I got bored from using my SHIELD solely for Moonlight). It’s also a fun side project to modernize and experiment with the aging, decade-old original codebase.

It is **not** intended to directly compete with or replace Moonlight. Instead, it’s an opinionated and streamlined rework focused solely on delivering a polished Apple TV experience.

> While upstream development may appear stalled (given the large number of open issues and pending PRs), there are signs of ongoing work behind the scenes. Some activity can be seen in development forks, and core developers have even hinted at future updates in community discussions. If you prefer a more general-purpose or officially supported experience, I’d recommend keeping an eye on Moonlight instead, as Artemis takes a different direction and may not be a right fit for everyone.

In this effort, iOS and iPadOS support has been removed to reduce complexity and keep development efforts focused.
Over time, Artemis will move away from the legacy Objective-C/C codebase towards a much more modern Swift approach. Dependencies will also be reduced where possible in favor of using native Apple frameworks and tools.


## Roadmap

- Migrate UI from Storyboard to SwiftUI
- Integrate relevant pending upstream PRs
- Add support for spatial audio
- Deeper Apollo integration (PIN pairing, virtual display support and management, and more)


## Soon-to-be Frequently Asked Questions

**Why is iOS support removed?**  
I don’t have time to maintain multiple platforms, and I’m currently only interested in tvOS.  
The codebase is a decade old, fairly large, and prone to complexity. I’d rather modernize and clean it first.  
Once that’s done, iOS/iPadOS support might return — but it’s not a current priority at all.

**It doesn’t work!**  
Open an issue! A Discord (or another community space) might come at a later date once the app has more meaningful features. 
In the meantime, useful resources include:
- [r/cloudygamer](https://reddit.com/r/cloudygamer)
- [r/moonlightstreaming](https://reddit.com/r/moonlightstreaming)
- The [Moonlight Discord](https://moonlight-stream.org/discord) (especially the `#apollo` channel)

**Can I contribute?**  
Absolutely! Feel free to open a PR if you're interested. I haven’t written contribution guidelines yet, but please:
- Keep things clean, the goal is to modernize the codebase, not the other way around 😉
- Use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#summary) convention
- Focus on tvOS-only features for now


## Building

* Install Xcode from the [App Store page](https://apps.apple.com/us/app/xcode/id497799835)
* Run `git clone --recursive https://github.com/p1carats/artemis-tvos.git`
  *  If you've already cloned the repo without `--recursive`, run `git submodule update --init --recursive`
* Open Artemis.xcodeproj in Xcode
* To run on a real device, you will need to locally modify the signing options:
  * Click on "Artemis" at the top of the left sidebar
  * Click on the "Signing & Capabilities" tab
  * Under "Targets", select "Artemis"
  * In the "Team" dropdown, select your name. If your name doesn't appear, you may need to sign into Xcode with your Apple account.
  * Change the "Bundle Identifier" to something different. You can add your name or some random letters to make it unique.
  * Now you can select your Apple device in the top bar as a target and click the Play button to run.