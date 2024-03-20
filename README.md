# 10 OpenTofu best practices for Naver Cloud Platform

The talk starts with live demos that show how OpenTofu works in action and how to use Infrastructure-as-Code (IaC) to manage your [NCloud](https://www.ncloud.com/) (demos: [1](demo_1_github/) and [2](demo_2_ncloud/)). Next, we review ten recommendations for your IaC projects with OpenTofu and Terraform. Following the recommendations will help you to level up the IaC in your organization. 

In the last demo — [NCloud & TACOS](demo_4_tacos/) — we show the benefits of running your OpenTofu and Terraform with an infrastructure orchestrator/[T(O)ACOS](https://www.youtube.com/watch?v=4MLBpBqZmpM) — [Spacelift](https://spacelift.io/how-it-works).

The talk aims to provide practical hints to help you start well, scale your IaC project later, and run alongside your Kubernetes environment.

In the repository, you will find:
- [slides](slides/index.pdf) ([html](slides/));
- demos: [the first steps and OpenTofu test](demo_1_github/), [create a VM on NCloud and shift-left with conftest](demo_2_ncloud/), [project structure](demo_3_project_structure/), and [NCloud & Spacelift](demo_4_tacos/).

🙇 Thank you for the opportunity to speak at the [NCUC 제 5회 Online MeetUp](https://www.meetup.com/navercloud-user-community/events/299190207/) and the NCloud User Community for the warm welcome.

Questions? Feedback? Let me know - wojciechb at spacelift.io, I am also on the Gophers, CloudNative, and Kubernetes slacks (Wojciech B). Helpful? Like [the LinkedIn post](https://www.linkedin.com/in/wojciechbarczynski/recent-activity/all/) or ⭐ to this github repo.

## Reading materials

- [OpenTofu docs](https://opentofu.org/docs/);
- [NCloud Terraform provider](https://github.com/NaverCloudPlatform/terraform-provider-ncloud);
- [NCloud tech blog](https://blog.naver.com/n_cloudplatform/223244982858);
- [Managing infrastructure at scale](https://spacelift.io/blog/scalable-infrastructure).
