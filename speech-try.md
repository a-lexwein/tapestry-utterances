1. Dos anybody in the audience have a strong opinion about pie charts?  Are pie charts good? Or are they bad?  The conversation has come a long way over the several years...and I think most people in the room would agree that: some pie charts are good, and others are bad. Which is to say:

2. It depends. For a lot of debates in about data visualization the answer ends up being "It depends".  It depends on the data. It depends on the audience.  It depends on the tools and the medium your using.  When we say *it depends*, the thing it depends on is the context.

The reason it depends is because we use charts to communicate and communication is a really complex and messy thing. Although it's messy, there are good tools for thinking about how communication works. A set of those tools I'm going to talk about today come from Linguistics.  Linguistics is a big field, but within it, there's a subfield known as *Pragmatics*, which is study how context affects the meaning of language. So this a talk how context affects meaning.

3. So, before we get into it. I thought it was important to give you some context about me.

First important thing about me: I'm not a linguist!  I'm also not a scientist. I'm not really a professional data visualizer either. But I do know what I'm talking about!

4. I like to describe myself as a Former Future Linguist.
5. Back in 2010, I started a PhD program at Ohio State, where I studied linguistics.  The plan was to to become a Linguistics Professor.  So back then I was a Future Linguist.
6. But again, not a linguist.  I only made it 2 years into my PhD, and moved to the Bay Area.  So yeah: I'm a Former Future Linguist.
7. And while I'm not the caliber of data visualizer. I'm comfortable desribing myself a "Native Speaker" Data Visualization, like probably everyone else here today. I've read a ton of charts. And I've made a lot as well, professionally, as well as for fun, in a ton of different contexts, using a ton of different tools. When I want to understand something quantitative, I make a chart. When I want to communicate something quantitative, I make a chart. And in my decade plus of communicating with charts, I've had some successes, but I've also made a lot of charts that have failed to communicate what I intended.  And I've gotten better at it over the years, but I still mess this up a fair amount. (Need a transition)

8. So linguistics: the scientific study of natural language. Everytime somebody says something and somebody else understands them, a lot of complicated processes are at work. Pragmatics, is one subfield, but there are a lot of others, and I'm going to spend one slide telling you about them.

On the one end we've got phonetics, which looks at the physical sounds of human speech. This has to do with how you move your mouth to produce the difference sounds (or if you're communicating in sign language: how you move your hands)

The we've got phonology, which deals with the abstract representations of these sounds (think: vowels and consonants) and how they combine in different languages. Phonemes are the smallest unit of language.

Next we have morphology. Morphemes are internal pieces of words that have meaning and structure. The S at the end of most plural nouns in English is a textbook example of a morpheme.

Beyond the word level, we have syntax: which is how words are structured to make sentences. This is about grammar: nouns and verbs and prepositions and everything else.

Next we come to semantics: how the meaning of words, in a particular syntactic structure combine to determine the meaning of sentences.

9. And finally, we get to Pragmatics, which again is all about how context impacts meaning.  And while pragmatics is most closely tied to semantics, all these fields are deeply interwoven. When a listener is processing what they are hearing, their building up the phonology, the syntax, and semantics all at the same time, based on all sorts of contextual clues.

10. By context, we essentially mean: everything else besides the words themselves. There are three important types of context. There's lingusitic context: what was just said.

"Alex made a chart. He used ggplot2."

"Robert made a chart. He used ggplot2."

So, despite being the same setence, they have different meanings.  One could be true and the other could be false.

There's also, situational context.


Okay, three more concepts to think about sentences.

We've got grammaticality:

"She plotted the residuals." That's a grammatical setence.
"She the residuals plotted" That's gibberish.

So, once we have a well-formed grammatical sentence, we can talk about its truth conditions: how the world would have to be in order for the setence to be true. Not all sentences are statements, but in a context, a statement will either be true or false. So taking the same sentence, in order for it to be true, there must be a some "She" who made a chart of "the residuals".

So, while we're all going around speaking mostly grammatical, mostly true setences. There are a lot of true/grammatical sentences out there (in fact there are an infinite number).  We need

How did she know the model was a good fit?
She plotted the residuals.

What do you want for dinner?
She plotted the residuals.

Sentences are abstract concepts, utterances happen in the world. An utterance has a speaker.  An utterance happens at a moment in time, in a particular place.  Which is to say, utterances have a context (and sentences don't).

Sentences have meaning, but the meaning is incomplete. Sentences have truth conditions, utterances have truth values.



Which bringsus  to a Philosopher of Language named HP Grice. He wrote one of the foundational works of pragamtics, where he attempted to systematize the unwritten rules that govern conversation.  In the 1975 paper Logic and Conversation, Grice gives his Cooperative Principle. I'm gonna just read this one verbatim: “Make your contribution such as it is required, at the stage at which it occurs, by the accepted purpose or direction of the talk exchange in which you are engaged.”

It's kind of a mouthful, but the idea is that conversation has a purpose, whether it's figuring out what to eat for dinner, expressing an idea about data visualization



This is how a lot of linguistics is done.

*Back at work on Monday*
Q: How did your talk go, Alex?

Response A: It went well, probably.

Response B: It went well, improbably.


This is a classical methodology within linguistics. Show the same sentence in two contexts and show how the meaning changes.  Or show two sentences in the same context and compare their meaning.  It's the change exactly one thing notion behind good science, but it relies on the personal judgments and artificial contexts.


Which brings us to the maxim of quantity. While all four maxims apply to charts, it's worth spending a little more time on Quanitty than the other three.

The maxim of quantity has two parts:

1. “Make your contribution as informative as is required (for the current purposes of the exchange).”
2. “Do not make your contribution more informative than is required.”

So the maxim of quantity sets up a Goldilocks situation, where you want to inform, but not over-inform.  Consider a linguistic example. "What did you have for dinner?"

If I answer "Lasgna", that feels felicitous, conveying the right amount of information.  Whereas, if I replied: "Food", that's not very helpful.  Similarly, if answered with a detailed list of all the ingredients in the lasagna, that wouldn't be very cooperative either.

This extends to charting in a lot of different dimensions.  So again, we'll use our handy "Just Right" version of chart of two diverging lines.  If the question is about A and B, then just plotting the series for A isn't going to cut it.  Likewise, including data on C, D, and E isn't going to help drive the decision between A and B.

But even if we just focus on A and B, there still plenty of ways to overinform and underinform.




Q: What did you have for lunch?

A1: Food.
A2: Lasagna
A3:
I had 2 tablespoons olive oil, 1 pound ground beef (85% lean), 1/2 cup chopped carrot, 1/2 cup finely chopped onion, 1 clove garlic, chopped, 1 teaspoon tomato paste, 2 teaspoons all-purpose flour, Splash red wine, 1 1/2 cups canned chopped tomatoes, with their juices, 1 cup beef stock, 1/2 teaspoon chopped fresh oregano, 3 tablespoons unsalted butter, 3 tablespoons all-purpose flour, 1 1/2 cups whole milk, Pinch freshly ground nutmeg, 1/2 package no-boil lasagna sheets, and 3/4 cup shredded fresh mozzarella.