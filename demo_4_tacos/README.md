# IaC at Scale with Spacelift

## Demo

### First run

1. [Github] Fork this repository.

2. [Spacelift] Go to https://spacelift.io/aws/free-trial and login with github. With it, you do not need to do any additional setup (see [Spacelift getting started](https://docs.spacelift.io/getting-started)).

3. [NaverCloud] Generate `NCLOUD_ACCESS_KEY` and `NCLOUD_SECRET_KEY`.

4. [Spacelift] Create a stack:

   1. [Connect to source code] As a repository, choose the forked repository;
   2. [Connect to source code] As a project root: `demo_2_naver/`;
   3. [Vendor] OpenTofu;
   4. Save & Continue.

5. [Spacelift] Add as secret env variables for your stack `NCLOUD_ACCESS_KEY` and `NCLOUD_SECRET_KEY`. 

6. [Spacelift] Create a context with one env variable `NCLOUD_REGION`, value `KR`.

7. [Spacelift] Attach the context to your stack.

8. [Spacelift] (Optional) Add [Plan Policy](https://docs.spacelift.io/concepts/policy/terraform-plan-policy) `only sampling`:

    ```rego
    package spacelift

    sample {
      true
    }
    ```

    Attach the policy to your stack; see the [docs](https://docs.spacelift.io/concepts/policy/#manually).

9. [Spacelift] Trigger the run:

   1. You will see output from `tofu plan`;
   2. Spacelift will ask you for the confirmation;
   3. After you confirm, you will see output from `tofu apply`;
   4. Compare the *Simplified view* vs *Full view*;
   5. In the full view, you can explore the input for the plan policy. Notice how much information you have available. You can also plug the output from linters (*tflint* or *conftest*) and security tools (*wiz*, *tfsec*,...). To learn more, check this [blog post](https://spacelift.io/blog/integrating-security-tools-with-spacelift).

10. [NaverCloud] You should see the server up and running in your console.

### Proposed runs

Imagine you need to add a tag for tracking costs `cost_center`:

1. [Github] Open a PR where you add a new tag to the `naver_server`:

   ```opentofu
     tag_list {
       tag_key   = "cost_center"
       tag_value = "8899"
     }
   ```

    in `demo_2_ncloud/my_vm.tf`, OpenTofu resource `naver_server`.

2. [Spacelift] Go to PRs in your stack, you will see Spacelift proposed run that validates the change.

3. [Spacelift] Compare *simplified* to the full view.

## References

- https://docs.spacelift.io/concepts/configuration/environment#per-stage-environment-variables
- https://spacelift.io/blog/scalable-infrastructure
