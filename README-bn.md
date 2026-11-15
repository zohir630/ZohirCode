# ফোনে OpenCode চালানোর নিয়ম

OpenCode এখানে ওয়েব UI হিসেবে চলে। তাই ফোনের ব্রাউজারেই ব্যবহার করা যায়, কম্পিউটার লাগে না।
কোনো লগইন নেই: কিছু না দিলে OpenCode-এর ফ্রি মডেল নিজে থেকে চালু হয়। পাসওয়ার্ড একবার বানানো হয়, টাইপ করতে হয় না।

## পথ ১: ফোনেই চালানো (Termux)
দরকার: Android ফোন, ফাঁকা ৩ GB জায়গা, মোটামুটি ৪ GB RAM, ইন্টারনেট।

1. F-Droid থেকে **Termux** ইনস্টল করুন (প্লে স্টোরেরটা পুরোনো, ওটা নয়)।
2. এই জিপের `setup.sh`, `start.sh`, `keys.env` ফোনের Download ফোল্ডারে রাখুন। Termux খুলে লিখুন:
   ```
   termux-setup-storage
   cp ~/storage/downloads/setup.sh ~/storage/downloads/start.sh ~/storage/downloads/keys.env ~/
   bash setup.sh
   ```
   (প্রথমবার ১৫-২০ মিনিট লাগতে পারে।)
3. প্রতিবার চালাতে: `bash start.sh`। ব্রাউজার নিজে খুলবে। না খুললে লেখা লিংকটা Chrome-এ দিন।
   ইউজার `opencode`, পাসওয়ার্ড স্ক্রিনে লেখা থাকে।
4. নিজের AI কী ব্যবহার করতে চাইলে `nano ~/opencode-keys.env` খুলে কী বসান। ফাঁকা রাখলে ফ্রি মডেল।
5. ফোন যেন বন্ধ করে না দেয়: Settings → Battery-তে Termux-কে "Unrestricted" দিন।

## পথ ২: GitHub Codespaces (ফোন দুর্বল হলে)
1. এই জিপের সব ফাইল একটা GitHub রিপোতে আপলোড করুন (`.devcontainer` ফোল্ডারসহ)।
2. রিপো → Code → Codespaces → Create codespace। খুলে গেলে পোর্ট ৪০৯৬ ব্রাউজারে খুলবে।
3. ক্লাউডে চলে, তাই ফোনে লোড পড়ে না। প্রতি মাসে ফ্রি ঘণ্টার সীমা আছে।
