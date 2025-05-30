# PostgreSQL সম্পর্কিত কিছু গুরুত্বপূর্ণ প্রশ্ন ও উত্তর

এই ডকুমেন্টটিতে PostgreSQL সম্পর্কিত কিছু মৌলিক প্রশ্নের উত্তর সহজ ভাষায় উপস্থাপন করা হয়েছে, যাতে নতুন শিক্ষার্থীদের বোঝার সুবিধা হয়।

---

## ১. PostgreSQL কী?

PostgreSQL হলো একটি ওপেন-সোর্স রিলেশনাল ডাটাবেইস ম্যানেজমেন্ট সিস্টেম (RDBMS), যেটি মূলত ডেটা সংরক্ষণ, পরিচালনা এবং বিভিন্ন ধরনের অনুসন্ধানের জন্য ব্যবহৃত হয়। SQL ব্যবহার করে ডেটার উপর কাজ করা যায় এবং এটি ACID কমপ্লায়েন্ট হওয়ায় ট্রানজ্যাকশন ভিত্তিক অ্যাপ্লিকেশনের জন্য খুবই নির্ভরযোগ্য।  
সহজভাবে বললে, PostgreSQL এমন একটি শক্তিশালী ডেটাবেইস, যা ছোট থেকে শুরু করে বড় অ্যাপ্লিকেশনের জন্য উপযুক্ত।

---

## ২. PostgreSQL-এ ডাটাবেইস স্কিমার উদ্দেশ্য কী?

ধরা যাক, আপনার ডাটাবেইসে বিভিন্ন বিভাগের তথ্য আছে যেমন HR, Accounts, IT ইত্যাদি। যদি সব টেবিল এক জায়গায় রাখেন, তাহলে সময়ের সাথে ঝামেলা বাড়বে।  
এই সমস্যা সমাধানের জন্য PostgreSQL স্কিমা ব্যবহার করতে দেয়। এটি একটি লজিক্যাল গ্রুপ, যেখানে টেবিল, ভিউ, ফাংশন ইত্যাদি আলাদা করে সংরক্ষণ করা যায়। এর ফলে, ডেটা গুছিয়ে রাখা যায় এবং আলাদা ইউজার বা অ্যাপ্লিকেশনের জন্য আলাদা অংশ তৈরি করা যায়।

---

## ৩. Primary Key এবং Foreign Key এর ধারণা ব্যাখ্যা করুন

### Primary Key:

এটি একটি টেবিলের এমন একটি কলাম (বা কলামের কম্বিনেশন), যা প্রতিটি রেকর্ডকে ইউনিকভাবে চিনতে সাহায্য করে। এই কলামে কখনও NULL ভ্যালু থাকে না এবং প্রতিটি মান একবারই থাকতে পারে। উদাহরণস্বরূপ, `student_id` একটি প্রাইমারি কি হতে পারে।

### Foreign Key:

Foreign Key এমন একটি কলাম যা অন্য টেবিলের Primary Key-এর সাথে সম্পর্ক তৈরি করে। এর মাধ্যমে দুইটি টেবিলের মধ্যে একটি লজিক্যাল সংযোগ স্থাপিত হয়। যেমন: `students.class_id` যদি `classes.id`-এর সাথে সম্পর্কযুক্ত হয়, তাহলে `class_id` হবে Foreign Key।

---

## ৪. SELECT স্টেটমেন্টে WHERE ক্লজের উদ্দেশ্য কী?

যখন ডেটাবেইসে থেকে কিছু নির্দিষ্ট রেকর্ড বের করতে হয়, তখন `WHERE` ক্লজ ব্যবহার করা হয়। এটি মূলত একটি শর্ত নির্ধারণ করে দেয়, যাতে শুধু প্রয়োজনীয় রেকর্ডগুলো ফিল্টার করে বের করা যায়।


## ৫. PostgreSQL-এ JOIN অপারেশনের গুরুত্ব ও এটি কীভাবে কাজ করে?

JOIN হলো এমন একটি প্রক্রিয়া, যার মাধ্যমে দুই বা তার অধিক টেবিলের মধ্যে সম্পর্ক তৈরি করে একত্রে ডেটা আনতে পারা যায়। এটি তখনই দরকার পড়ে, যখন আমাদের একাধিক টেবিলের তথ্য একসাথে লাগবে।# assignment2
