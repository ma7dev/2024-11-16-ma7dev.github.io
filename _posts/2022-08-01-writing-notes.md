---
layout: post
title: "How I write my notes [Part 1]"
date: 2022-08-01 08:57:00-0400
description: In this post, I will share the tools that I use, my general thoughts about the setup, and an example of how I would go about writing a note.
# tags: formatting jupyter
categories: [Productivity, Learning]
tags: [notion, obsidian, okular, mathpix, insync]
# giscus_comments: true
disqus_comments: true
related_posts: true
datatable: true
toc:
  sidebar: left
---

In this post, I will share the tools that I use, my general thoughts about the setup, and an example of how I would go about writing a note.

Here are the tools that I use to have an active and productive experience when learning from books, courses, and general content (e.g. YT vids, online articles, etc.):
- [Notion](https://notion.so) for project planning, reading list tracking, and scratch pad for logging and writing random notes for certain projects. It is basically used as a database and a tracker of the progression of my learning/consumption of the content.
- [Obsidian](https://obsidian.md/) for perma-notes and I use [LYT setup](https://www.youtube.com/watch?v=ftzQOkzGCLg), which is a fluid system to take notes.
- As I only read digital books, I use [Okular](https://okular.kde.org/) as my pdf reader/highlighter.
- [MathPix](https://mathpix.com/) for converting equations to LaTeX equations to be imported to Obsidian.
- [Insync](https://www.insynchq.com) to store my notes and pdf files on the cloud.

My thoughts:
- As I have ADHD, it is easy to get distracted by multiple things and be focused on small and unimportant details, so my pipeline is structured (at least for me) while giving me the freedom to grow and mature as my learning experience is.
- My Obsidian notes are 1. an extension to my thoughts 2. organized of content. The notes aren't meant to be read by others, they are meant for me to interact with the content.
- I believe in recycling information to develop a strong knowledge of some context. This means reading about `backprop` from school/traditional course will give me an idea of how `backprop` works, but when reading `PyTorch`'s implementation of `backprop` will give me more interesting and practical information about how `backprop` is actually implemented and used. Those two data point share `backprop` but they are learned at a different time of my life (which means I am a different person) so when creating the notes, they won't be connected besides knowing their sources and they are related to `Deep Learning note`, which is enough connection. Hence, the parent note (`Deep Learning note`) is always organized to have a nice TOC of connected notes to ease the process of exploring my notes.

Here is an example for when going through the [`Full Stack Deep Learning Course`](https://fullstackdeeplearning.com/) pre-labs:
- On Notion, I import the course structure and labs into my `study_plan` database and set `pre-labs` as `Not started` for me to view them into `TODO` tab.
![](/assets/img/writing-notes/1.png)
![](/assets/img/writing-notes/2.png)

- When I am ready to tackle any of the learning material, I use `study_logs` database as a scratch pad to write my thoughts while learning the material. Here is an example for the first lab.
![](/assets/img/writing-notes/3.png)
![](/assets/img/writing-notes/4.png)
- When I am done consuming the content, I move to Obsidian to write useful information to be stored to improve my knowledgebase system. Left note is for the lab 1 note and right note is for the course note where I use it as a TOC
![](/assets/img/writing-notes/5.png)
