# GitHub Web UI Workaround – Rewriting Commit Messages for Image Files

**Author:** Viktor Halupka  
**Project:** DarkLab  
**Date:** 14-07-2025

---

## 📌 Purpose

In Git, commit messages cannot be edited retroactively via GitHub Web UI. However, for clarity and professional polish, it's sometimes useful to clean up meaningless or misleading commit messages—especially for uploaded assets like screenshots.

This document outlines a clever and safe workaround to rewrite commit messages *without* needing Git CLI, rebase, or force push.

---

## 🔁 Method: Rename + Restore Strategy

### 🧠 Idea:
GitHub shows only the **last commit** related to a file. If you:
1. **Rename** a file,
2. Then **rename it back to the original**,  
you get a new commit entry — where you can write a clean, meaningful commit message.

---

## ✅ Step-by-Step

1. Go to the image file in the GitHub Web UI.
2. Click the pencil icon (✏️) to enter "Edit this file" mode.
3. Change the file name slightly, e.g.:
   ```
   ssh_fedora_to_win.png → ssh_fedora_to_win_1.png
   ```
4. Scroll down, and in the **commit message field**, enter something like:
   ```
   Temp rename to refresh commit history
   ```
5. Commit the change directly to `main` (or your branch).
6. Now repeat:
   - Rename the file back to the original:
     ```
     ssh_fedora_to_win_1.png → ssh_fedora_to_win.png
     ```
   - And this time, enter a **meaningful commit message**, e.g.:
     ```
     Add screenshot: Fedora to Windows SSH login test
     ```

---

## 💡 Result

- The **image file name stays the same**.
- The **latest commit message becomes useful and descriptive**.
- No need for Git CLI or `--force` push.
- Clean history, good for documentation, GitHub Pages, recruiters, and future readers.

---

## 🛠️ Tip

If you plan to do this for many files, keep a checklist like:

| File Name                  | Old Commit Msg      | New Commit Msg                           |
|---------------------------|---------------------|-------------------------------------------|
| `ssh_fedora_to_win.png`   | `Update`            | `Add screenshot Fedora → Win11 SSH`       |
| `win_ssh_to_fedora.png`   | `asdwawadawd`       | `Add screenshot Win11 → Fedora SSH`       |
| `dual_connection.png`     | `image`             | `Add test result: dual SSH session`       |

---

## 👏 Credits

Idea and execution by Viktor Halupka using GitHub Web UI only —  
no terminal, no rebase, no risk.  
Proof that you can still work clean and smart even within GitHub’s browser limits.
