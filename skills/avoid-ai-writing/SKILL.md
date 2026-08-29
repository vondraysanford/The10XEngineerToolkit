---
name: avoid-ai-writing
description: Remove AI writing patterns from prose. Use this skill when you write or edit text that a human reads as text, not as code, including blog posts, LinkedIn posts, READMEs, documentation, commit messages, PR descriptions, and emails.
---

Write like a person who knows the subject and respects the reader's time. AI-generated prose has recognizable patterns. Readers discount text that shows them. Remove every one.

## Banned patterns

**Punctuation and structure**

- Do not use an em dash inside a sentence. Use a period, a comma, or a colon. An em dash is acceptable only as a label separator in a header or a list item.
- Do not use the "It's not X, it's Y" construction, or any variant ("This isn't about X. It's about Y.").
- Do not use the rule of three ("faster, cheaper, and more reliable") unless each of the three items carries real information.
- Do not open with a rhetorical question. Do not write one-sentence drama paragraphs ("The result?").
- Do not announce the text ("In this post, I will explain…"). Start with the content.
- Do not write with uniform rhythm. Vary sentence length and paragraph length. Detection tools weight structural uniformity above vocabulary, so a word pass alone does not fix AI-sounding text.

**Vocabulary**

- Do not use consultant words: leverage, utilize, robust, seamless, cutting-edge, game-changer, delve, landscape, journey, unlock, empower, elevate, supercharge, holistic, synergy, tapestry, testament to, nestled, vibrant, thriving, showcasing.
- Do not use hedging filler: "It's worth noting that", "It's important to remember", "At the end of the day".
- Do not use hype adjectives for your own work: powerful, amazing, incredible, revolutionary.
- Do not replace "is" and "has" with inflated verbs: serves as, features, boasts, represents. Use a more specific verb only when it adds real information.
- Do not close with a generic conclusion: "The future looks bright", "Only time will tell". End with a specific point, or end one sentence earlier.

**Tone**

- Do not flatter the reader ("Great question!"). Do not apologize for the text.
- Do not inflate the stakes. A bug fix is a bug fix.
- Do not attribute a claim to an unnamed source: "Experts believe", "Studies show". Name the source, or state the claim as your own.
- Make claims with numbers, or do not make the claim. "Reduced the lookup from 20 minutes to 2 seconds" beats "dramatically faster".

## Method

1. Write the draft.
2. Do a pattern pass. Search the draft for each banned item above and remove it.
3. Do a read-aloud pass. Read the text aloud. Rewrite each sentence that you would not say to a colleague.
4. Cut 10–20%. First drafts run long. Remove the sentences that repeat a point the reader already has.
5. Stop while the text still sounds like you. Over-editing removes natural irregularity, and that pushes the text toward the AI statistical profile. Keep fragments and uneven pacing when they carry your voice.

## Context profiles

- **Blog post:** first person. Say what happened, what it cost, and what you learned. Include the failed attempts. A post with no failure reads as marketing.
- **LinkedIn:** no engagement-bait hooks, no hashtag piles, no "Agree?". One idea per post, with the evidence in the post.
- **Commit message / PR description:** imperative mood, facts only. State what changed and why. No adjectives.
- **README / documentation:** instructions in the imperative. One instruction per sentence. Test each step before you write it as fact.

## Customize this

- Add the filler words that you personally overuse.
- Add per-audience rules (your team's tone for incident updates, your voice for public posts).

## Credits

Some patterns come from [conorbronsdon/avoid-ai-writing](https://github.com/conorbronsdon/avoid-ai-writing) (MIT) and Pangram Labs detection research.
