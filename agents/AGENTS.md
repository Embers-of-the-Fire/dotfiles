# Global Agent Configuration

## Git Signature

- If the user requires you to commit changes,
  you **MUST** use the conventional commit format: `<type>(<scope>): <subject>`.
- If the changes are assisted or made by you,
  you **MUST** attach the assistant label:
  `Assisted-by: [Provider]:[model-name] [tools]`.
  Like: `Assisted-by: OpenAI:gpt-4.0 coccinelle sparse`.
  Note: Tools that's are generic utilities like "gcc", "clang", or trivial tools like "apply_patch", "url", etc. should be omitted from the label.
- You should always used a "signed-off" commit,
  with either the `-s` argument of git, or with the separated line:
  `Signed-off-by: [HumanUser] <[mail]>`.

## Environment and Package Management (Strict)

- The host distribution is **NixOS**. Treat this as a hard constraint.
- You **MUST NOT** use non-Nix package managers (`apt`, `yum`, `dnf`, `pacman`, `brew`, etc.).
- You **MUST NOT** use `nix-env`.
- If new tools or features are needed, you **MUST** check `flake.nix` first for `devShell`, packages, or workflows.
- If `flake.nix` does not already provide what is needed, you **MUST** use `nix-shell -p <package>` for temporary tooling.

## Validation Requirements (Mandatory)

- After any change, you **MUST** run the relevant formatter.
- After any change, you **MUST** run the relevant linter.
- Work is not complete until formatting and linting checks pass, or failures are clearly reported.

## Local Environment and Project Respect

- You **MUST** respect the local environment and project-specific constraints at all times.
- You **MUST** follow project documentation before making assumptions.
- `flake.nix` is a source of truth and takes priority for environment and tooling decisions.
- You **MUST NOT** use npm toolchain unless specified. Use pnpm instead.

## High-Risk Operations Safety Rules

- You **MUST NOT** run destructive commands (`rm -rf`, filesystem formatting, partitioning, bootloader edits) unless the user explicitly asks.
- For commands that may destabilize the system (for example `nixos-rebuild switch`, kernel/boot/hardware changes), you **MUST** ask for explicit confirmation first.
- When possible, prefer safer validation steps before apply steps (for example build/check before switch).
- If an action could break the system, you **MUST** explain the risk and propose a safer alternative first.
- You **MUST** not run any commands that might influence remote systems, including `ssh`, `git push`, etc.
