public class DesrilizepullRequest {
public cls_pullrequest pullrequest;
	public cls_repository repository;
	public cls_actor actor;
	public class cls_pullrequest {
		public cls_rendered rendered;
		public String type;	//pullrequest
		public String description;	// gujk
		public cls_links links;
		public String title;	//TestBranch
		public boolean close_source_branch;
		public cls_reviewers[] reviewers;
		public Integer id;	//1
		public cls_destination destination;
		public String created_on;	//2022-02-02T07:39:19.026734+00:00
		public cls_summary summary;
		public cls_source source;
		public Integer comment_count;	//0
		public String state;	//OPEN
		public Integer task_count;	//0
		public cls_participants[] participants;
		public String reason;	//
		public String updated_on;	//2022-02-02T07:39:19.272367+00:00
		public cls_author author;
		public cls_merge_commit merge_commit;
		public cls_closed_by closed_by;
	}
	public class cls_rendered {
		public cls_description description;
		public cls_title title;
	}
   public class cls_description {
		public String raw;	//* gujk
		public String markup;	//markdown
		public String html;	//<ul>

		public String type;	//rendered
	}
	public class cls_title {
		public String raw;	//TestBranch
		public String markup;	//markdown
		public String html;	//<p>TestBranch</p>
		public String type;	//rendered
	}
	public class cls_links {
		public cls_self self;
		public cls_html html;
		public cls_avatar avatar;
	}
	public class cls_decline {
		public String href;	//https://api.bitbucket.org/2.0/repositories/deepak_984/testrepo/pullrequests/1/decline
	}
	class cls_diffstat {
		public String href;	//https://api.bitbucket.org/2.0/repositories/deepak_984/testrepo/diffstat/deepak_984/testrepo:74ec68b47f13%0D2d7d76972c00?from_pullrequest_id=1
	}
	class cls_commits {
		public String href;	//https://api.bitbucket.org/2.0/repositories/deepak_984/testrepo/pullrequests/1/commits
	}
	class cls_self {
		public String href;	//https://api.bitbucket.org/2.0/users/%7Bf38e393c-5683-4d91-a9cf-b22c81b54089%7D
	}
	class cls_comments {
		public String href;	//https://api.bitbucket.org/2.0/repositories/deepak_984/testrepo/pullrequests/1/comments
	}
	class cls_merge {
		public String href;	//https://api.bitbucket.org/2.0/repositories/deepak_984/testrepo/pullrequests/1/merge
	}
	class cls_html {
		public String href;	//https://bitbucket.org/%7Bf38e393c-5683-4d91-a9cf-b22c81b54089%7D/
	}
	class cls_activity {
		public String href;	//https://api.bitbucket.org/2.0/repositories/deepak_984/testrepo/pullrequests/1/activity
	}
	
	class cls_diff {
		public String href;	//https://api.bitbucket.org/2.0/repositories/deepak_984/testrepo/diff/deepak_984/testrepo:74ec68b47f13%0D2d7d76972c00?from_pullrequest_id=1
	}
	class cls_approve {
		public String href;	//https://api.bitbucket.org/2.0/repositories/deepak_984/testrepo/pullrequests/1/approve
	}
	class cls_statuses {
		public String href;	//https://api.bitbucket.org/2.0/repositories/deepak_984/testrepo/pullrequests/1/statuses
	}
	class cls_reviewers {
	}
	public class cls_destination {
		public cls_commit commits;
		public cls_repository repository;
		public cls_branch branch;
	}
	class cls_commit {
		public String hash;	//74ec68b47f13
		public String type;	//commit
		public cls_links links;
	}
	class cls_repository {
		public String scm;	//git
		public cls_website website;
		public String uuid;	//{69646068-8b5f-4b78-bb15-dbc381681a4e}
		public cls_links links;
		public cls_project project;
		public String full_name;	//deepak_984/testrepo
		public cls_owner owner;
		public cls_workspace workspace;
		public String type;	//repository
		public boolean is_private;
		public String name;	//TestRepo
	}
	class cls_avatar {
		public String href;	//https://secure.gravatar.com/avatar/81d85fc06c7f8904863b594d2a13e9d3?d=https%3A%2F%2Favatar-management--avatars.us-west-2.prod.public.atl-paas.net%2Finitials%2FDS-2.png
	}
	class cls_branch {
		public String name;	//TestBranch
	}
	class cls_summary {
		public String raw;	//* gujk
		public String markup;	//markdown
		public String html;	//<ul>

		public String type;	//rendered
	}
	class cls_source {
		public cls_commit commits;
		public cls_repository repository;
		public cls_branch branch;
	}
	class cls_participants {
	}
	public class cls_author {
		public String display_name;	//deepak soni
		public String uuid;	//{f38e393c-5683-4d91-a9cf-b22c81b54089}
		public cls_links links;
		public String type;	//user
		public String nickname;	//deepak soni
		public String account_id;	//61f8d92c530d2a0071466507
	}
	class cls_merge_commit {
	}
	class cls_closed_by {
	}
	class cls_website {
	}
	class cls_project {
		public cls_links links;
		public String type;	//project
		public String name;	//TestPipeline
		public String key;	//TES
		public String uuid;	//{6af3e2be-e609-4b02-ba04-153f0b893c87}
	}
	class cls_owner {
		public String display_name;	//deepak soni
		public String uuid;	//{f38e393c-5683-4d91-a9cf-b22c81b54089}
		public cls_links links;
		public String type;	//user
		public String nickname;	//deepak soni
		public String account_id;	//61f8d92c530d2a0071466507
	}
	class cls_workspace {
		public String slug;	//deepak_984
		public String type;	//workspace
		public String name;	//deepak soni
		public cls_links links;
		public String uuid;	//{f38e393c-5683-4d91-a9cf-b22c81b54089}
	}
	class cls_actor {
		public String display_name;	//deepak soni
		public String uuid;	//{f38e393c-5683-4d91-a9cf-b22c81b54089}
		public cls_links links;
		public String type;	//user
		public String nickname;	//deepak soni
		public String account_id;	//61f8d92c530d2a0071466507
	}
	public static DesrilizepullRequest parse(String json){
		return (DesrilizepullRequest) System.JSON.deserialize(json, DesrilizepullRequest.class);
	}
}