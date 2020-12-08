
class ReposData {
    bool private;
    String archive_url;
    bool archived;
    String assignees_url;
    String blobs_url;
    String branches_url;
    String clone_url;
    String collaborators_url;
    String comments_url;
    String commits_url;
    String compare_url;
    String contents_url;
    String contributors_url;
    String created_at;
    String default_branch;
    String deployments_url;
    String description;
    bool disabled;
    String downloads_url;
    String events_url;
    bool fork;
    int forks;
    int forks_count;
    String forks_url;
    String full_name;
    String git_commits_url;
    String git_refs_url;
    String git_tags_url;
    String git_url;
    bool has_downloads;
    bool has_issues;
    bool has_pages;
    bool has_projects;
    bool has_wiki;
    String homepage;
    String hooks_url;
    String html_url;
    int id;
    int ids=0;
    String issue_comment_url;
    String issue_events_url;
    String issues_url;
    String keys_url;
    String labels_url;
    String language;
    String languages_url;
    License license;
    String merges_url;
    String milestones_url;
    String mirror_url;
    String name;
    String node_id;
    String notifications_url;
    int open_issues;
    int open_issues_count;
    Owner owner;
    String pulls_url;
    String pushed_at;
    String releases_url;
    int size;
    String ssh_url;
    int stargazers_count;
    String stargazers_url;
    String statuses_url;
    String subscribers_url;
    String subscription_url;
    String svn_url;
    String tags_url;
    String teams_url;
    String trees_url;
    String updated_at;
    String url;
    int watchers;
    int watchers_count;

    ReposData({this.private, this.archive_url, this.archived, this.assignees_url, this.blobs_url, this.branches_url, this.clone_url, this.collaborators_url, this.comments_url, this.commits_url, this.compare_url, this.contents_url, this.contributors_url, this.created_at, this.default_branch, this.deployments_url, this.description, this.disabled, this.downloads_url, this.events_url, this.fork, this.forks, this.forks_count, this.forks_url, this.full_name, this.git_commits_url, this.git_refs_url, this.git_tags_url, this.git_url, this.has_downloads, this.has_issues, this.has_pages, this.has_projects, this.has_wiki, this.homepage, this.hooks_url, this.html_url, this.id, this.issue_comment_url, this.issue_events_url, this.issues_url, this.keys_url, this.labels_url, this.language, this.languages_url, this.license, this.merges_url, this.milestones_url, this.mirror_url, this.name, this.node_id, this.notifications_url, this.open_issues, this.open_issues_count, this.owner, this.pulls_url, this.pushed_at, this.releases_url, this.size, this.ssh_url, this.stargazers_count, this.stargazers_url, this.statuses_url, this.subscribers_url, this.subscription_url, this.svn_url, this.tags_url, this.teams_url, this.trees_url, this.updated_at, this.url, this.watchers, this.watchers_count});

    factory ReposData.fromJson(Map<String, dynamic> json) {
        return ReposData(
            private: json['private']??"",
            archive_url: json['archive_url']??"",
            archived: json['archived']??"",
            assignees_url: json['assignees_url']??"",
            blobs_url: json['blobs_url']??"",
            branches_url: json['branches_url']??"",
            clone_url: json['clone_url']??"",
            collaborators_url: json['collaborators_url']??"",
            comments_url: json['comments_url']??"",
            commits_url: json['commits_url']??"",
            compare_url: json['compare_url']??"",
            contents_url: json['contents_url']??"",
            contributors_url: json['contributors_url']??"",
            created_at: json['created_at']??"",
            default_branch: json['default_branch']??"",
            deployments_url: json['deployments_url']??"",
            description: json['description']??"",
            disabled: json['disabled']??"",
            downloads_url: json['downloads_url']??"",
            events_url: json['events_url']??"",
            fork: json['fork']??"",
            forks: json['forks']??"",
            forks_count: json['forks_count']??"",
            forks_url: json['forks_url']??"",
            full_name: json['full_name']??"",
            git_commits_url: json['git_commits_url']??"",
            git_refs_url: json['git_refs_url']??"",
            git_tags_url: json['git_tags_url']??"",
            git_url: json['git_url']??"",
            has_downloads: json['has_downloads']??"",
            has_issues: json['has_issues']??"",
            has_pages: json['has_pages']??"",
            has_projects: json['has_projects']??"",
            has_wiki: json['has_wiki']??"",
            homepage: json['homepage'] != null ? json['homepage'] : null,
            hooks_url: json['hooks_url']??"",
            html_url: json['html_url']??"",
            id: json['id']??"",
            issue_comment_url: json['issue_comment_url']??"",
            issue_events_url: json['issue_events_url']??"",
            issues_url: json['issues_url']??"",
            keys_url: json['keys_url']??"",
            labels_url: json['labels_url']??"",
            language: json['language'] != null ? json['language']: null,
            languages_url: json['languages_url'],
            license: json['license'] != null ? License?.fromJson(json['license']) : null,
            merges_url: json['merges_url']??"",
            milestones_url: json['milestones_url']??"",
            mirror_url: json['mirror_url'] != null ? json['mirror_url'] : null,
            name: json['name']??"",
            node_id: json['node_id']??"",
            notifications_url: json['notifications_url']??"",
            open_issues: json['open_issues']??"",
            open_issues_count: json['open_issues_count']??"",
            owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
            pulls_url: json['pulls_url']??"",
            pushed_at: json['pushed_at']??"",
            releases_url: json['releases_url']??"",
            size: json['size']??"",
            ssh_url: json['ssh_url']??"",
            stargazers_count: json['stargazers_count']??"",
            stargazers_url: json['stargazers_url']??"",
            statuses_url: json['statuses_url']??"",
            subscribers_url: json['subscribers_url']??"",
            subscription_url: json['subscription_url']??"",
            svn_url: json['svn_url']??"",
            tags_url: json['tags_url']??"",
            teams_url: json['teams_url']??"",
            trees_url: json['trees_url']??"",
            updated_at: json['updated_at']??"",
            url: json['url']??"",
            watchers: json['watchers']??"",
            watchers_count: json['watchers_count']??"",
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['private'] = this.private;
        data['archive_url'] = this.archive_url;
        data['archived'] = this.archived;
        data['assignees_url'] = this.assignees_url;
        data['blobs_url'] = this.blobs_url;
        data['branches_url'] = this.branches_url;
        data['clone_url'] = this.clone_url;
        data['collaborators_url'] = this.collaborators_url;
        data['comments_url'] = this.comments_url;
        data['commits_url'] = this.commits_url;
        data['compare_url'] = this.compare_url;
        data['contents_url'] = this.contents_url;
        data['contributors_url'] = this.contributors_url;
        data['created_at'] = this.created_at;
        data['default_branch'] = this.default_branch;
        data['deployments_url'] = this.deployments_url;
        data['description'] = this.description;
        data['disabled'] = this.disabled;
        data['downloads_url'] = this.downloads_url;
        data['events_url'] = this.events_url;
        data['fork'] = this.fork;
        data['forks'] = this.forks;
        data['forks_count'] = this.forks_count;
        data['forks_url'] = this.forks_url;
        data['full_name'] = this.full_name;
        data['git_commits_url'] = this.git_commits_url;
        data['git_refs_url'] = this.git_refs_url;
        data['git_tags_url'] = this.git_tags_url;
        data['git_url'] = this.git_url;
        data['has_downloads'] = this.has_downloads;
        data['has_issues'] = this.has_issues;
        data['has_pages'] = this.has_pages;
        data['has_projects'] = this.has_projects;
        data['has_wiki'] = this.has_wiki;
        data['hooks_url'] = this.hooks_url;
        data['html_url'] = this.html_url;
        data['id'] = this.id;
        data['issue_comment_url'] = this.issue_comment_url;
        data['issue_events_url'] = this.issue_events_url;
        data['issues_url'] = this.issues_url;
        data['keys_url'] = this.keys_url;
        data['labels_url'] = this.labels_url;
        data['languages_url'] = this.languages_url;
        data['merges_url'] = this.merges_url;
        data['milestones_url'] = this.milestones_url;
        data['name'] = this.name;
        data['node_id'] = this.node_id;
        data['notifications_url'] = this.notifications_url;
        data['open_issues'] = this.open_issues;
        data['open_issues_count'] = this.open_issues_count;
        data['pulls_url'] = this.pulls_url;
        data['pushed_at'] = this.pushed_at;
        data['releases_url'] = this.releases_url;
        data['size'] = this.size;
        data['ssh_url'] = this.ssh_url;
        data['stargazers_count'] = this.stargazers_count;
        data['stargazers_url'] = this.stargazers_url;
        data['statuses_url'] = this.statuses_url;
        data['subscribers_url'] = this.subscribers_url;
        data['subscription_url'] = this.subscription_url;
        data['svn_url'] = this.svn_url;
        data['tags_url'] = this.tags_url;
        data['teams_url'] = this.teams_url;
        data['trees_url'] = this.trees_url;
        data['updated_at'] = this.updated_at;
        data['url'] = this.url;
        data['watchers'] = this.watchers;
        data['watchers_count'] = this.watchers_count;
        if (this.homepage != null) {
            data['homepage'] = this.homepage;
        }
        if (this.language != null) {
            data['language'] = this.language;
        }
        if (this.license != null) {
            data['license'] = this.license.toJson();
        }
        if (this.mirror_url != null) {
            data['mirror_url'] = this.mirror_url;
        }
        if (this.owner != null) {
            data['owner'] = this.owner.toJson();
        }
        return data;
    }
}

class Owner {
    String avatar_url;
    String events_url;
    String followers_url;
    String following_url;
    String gists_url;
    String gravatar_id;
    String html_url;
    int id;
    String login;
    String node_id;
    String organizations_url;
    String received_events_url;
    String repos_url;
    bool site_admin;
    String starred_url;
    String subscriptions_url;
    String type;
    String url;

    Owner({this.avatar_url, this.events_url, this.followers_url, this.following_url, this.gists_url, this.gravatar_id, this.html_url, this.id, this.login, this.node_id, this.organizations_url, this.received_events_url, this.repos_url, this.site_admin, this.starred_url, this.subscriptions_url, this.type, this.url});

    factory Owner.fromJson(Map<String, dynamic> json) {
        return Owner(
            avatar_url: json['avatar_url'],
            events_url: json['events_url'],
            followers_url: json['followers_url'],
            following_url: json['following_url'],
            gists_url: json['gists_url'],
            gravatar_id: json['gravatar_id'],
            html_url: json['html_url'],
            id: json['id'],
            login: json['login'],
            node_id: json['node_id'],
            organizations_url: json['organizations_url'],
            received_events_url: json['received_events_url'],
            repos_url: json['repos_url'],
            site_admin: json['site_admin'],
            starred_url: json['starred_url'],
            subscriptions_url: json['subscriptions_url'],
            type: json['type'],
            url: json['url'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['avatar_url'] = this.avatar_url;
        data['events_url'] = this.events_url;
        data['followers_url'] = this.followers_url;
        data['following_url'] = this.following_url;
        data['gists_url'] = this.gists_url;
        data['gravatar_id'] = this.gravatar_id;
        data['html_url'] = this.html_url;
        data['id'] = this.id;
        data['login'] = this.login;
        data['node_id'] = this.node_id;
        data['organizations_url'] = this.organizations_url;
        data['received_events_url'] = this.received_events_url;
        data['repos_url'] = this.repos_url;
        data['site_admin'] = this.site_admin;
        data['starred_url'] = this.starred_url;
        data['subscriptions_url'] = this.subscriptions_url;
        data['type'] = this.type;
        data['url'] = this.url;
        return data;
    }
}

class License {
    String key;
    String name;
    String node_id;
    String spdx_id;
    String url;

    License({this.key, this.name, this.node_id, this.spdx_id, this.url});

    factory License.fromJson(Map<String, dynamic> json) {
        return License(
            key: json['key'],
            name: json['name'],
            node_id: json['node_id'],
            spdx_id: json['spdx_id'],
            url: json['url'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['key'] = this.key;
        data['name'] = this.name;
        data['node_id'] = this.node_id;
        data['spdx_id'] = this.spdx_id;
        data['url'] = this.url;
        return data;
    }
}