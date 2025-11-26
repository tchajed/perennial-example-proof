From New.generatedproof.github_com.tchajed Require Import perennial_example_proof.
From New.proof Require Import proof_prelude.

Section proof.
Context `{hG: heapGS Σ, !ffi_semantics _ _} `{!globalsGS Σ} {go_ctx : GoContext}.

#[global] Instance : IsPkgInit ver_example := define_is_pkg_init True%I.
#[global] Instance : GetIsPkgInitWf ver_example := build_get_is_pkg_init_wf.

Lemma wp_Swap (x y: loc) (x_v y_v: w64) :
  {{{ is_pkg_init ver_example ∗ x ↦ x_v ∗ y ↦ y_v }}}
    @! ver_example.Swap #x #y
  {{{ RET #(); x ↦ y_v ∗ y ↦ x_v }}}.
Proof.
  wp_start as "[Hx Hy]".
  wp_auto.
  iApply "HΦ".
  iFrame.
Qed.

End proof.
