# Autofill git commit troubleshooting

A practical troubleshooting guide for setting up Git commit templates and Visual Studio Code integration on Windows, WSL, and Git Bash.

---

## ✅ Goal

Ensure that running `git commit`:

- opens VS Code as the editor
- uses a pre-written commit message template
- works in all environments: Git Bash, PowerShell, and WSL

---

## 🧩 Common Symptom

> You run `git commit` but **nothing happens**, and the editor does not open.

### This can happen when:

- There are **no staged changes**
- The **editor is misconfigured**
- You're using **Git Bash with path quoting issues**
- You're in a **BitLocker-encrypted directory that's not fully unlocked**
- The **commit template path is not readable or not in Unix-style format** (in Git Bash or WSL)

---

## 🧪 Quick Sanity Test (run in Git Bash or WSL)

```bash
git config --global core.editor "code --wait"
git config --global commit.template "/mnt/c/Users/YOUR_USERNAME/gitmessage.txt"
```

Replace `YOUR_USERNAME` with your actual user folder name (e.g. `bigda`).

Test:

```bash
cd /mnt/d/GitHub/DarkLab
echo "# test" >> TEMP_TEST.md
git add TEMP_TEST.md
git commit
```

---

## 🛠️ If it still doesn't open VS Code

### Option A – Git Bash workaround

Use this form to bypass core.editor entirely:

```bash
GIT_EDITOR="C:/Users/YOUR_USERNAME/AppData/Local/Programs/Microsoft VS Code/bin/code.cmd --wait" git commit
```

### Option B – PowerShell workaround

```powershell
$env:GIT_EDITOR = "C:\Users\YOUR_USERNAME\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd --wait"
git commit
```

### Option C – WSL (recommended)

```bash
git config --global core.editor "code --wait"
git config --global commit.template "/mnt/c/Users/YOUR_USERNAME/gitmessage.txt"
cd /mnt/d/GitHub/DarkLab
git commit
```

If everything is set up correctly, this will launch VS Code with the commit template loaded.

---

## 🧼 Cleanup

Remove the test file after testing:

```bash
git reset
rm TEMP_TEST.md     # in WSL
del TEMP_TEST.md    # in PowerShell
```

---

## 🙌 You're good to go!

Commit template + VS Code integration is now working across all shells 🚀
