import 'achievement.dart';
import 'company.dart';
import 'company_role.dart';
import 'country.dart';
import 'current_membership_grade.dart';
import 'education.dart';
import 'experience.dart';
import 'next_membership_grade.dart';
import 'role.dart';
//import 'timeline.dart';
import 'user_tag.dart';
import 'user_title_type.dart';

List<User> getUsers(Iterable<dynamic> data) =>
    List<User>.from(data.map((x) => User.fromJson(x as Map<String, dynamic>)));

class User {
  int? id;
  int? companyId;
  int? roleId;
  int? companyRoleId;
  int? countryId;
  int? userTitleTypesId;
  dynamic currencyId;
  dynamic contactNumberTypesId;
  dynamic maritalStatusId;
  dynamic genderId;
  int? currentMembershipGradeId;
  int? nextMembershipGradeId;
  String? slug;
  String? firstName;
  String? lastName;
  String? email;
  int? emailVisibility;
  dynamic dateOfBirth;
  String? avatar;
  String? banner;
  String? professionalTitle;
  String? area;
  String? contactNumber;
  bool? contactNumberVisibility;
  int? contactableWhatsapp;
  int? contactableSms;
  dynamic website;
  bool? websiteVisibility;
  dynamic skype;
  bool? skypeVisibility;
  String? facebook;
  bool? facebookVisibility;
  String? twitter;
  bool? twitterVisibility;
  String? google;
  bool? googleVisibility;
  String? xing;
  bool? xingVisibility;
  String? linkedin;
  bool? linkedinVisibility;
  dynamic proxycurlWhodis;
  bool? allowRecruiterAccess;
  dynamic address1;
  dynamic address2;
  dynamic addressPostalCode;
  dynamic addressArea;
  dynamic workPermits;
  bool? relocate;
  dynamic nextJob;
  dynamic salaryExpectation;
  String? profileSummary;
  bool? active;
  String? profileVideoTitle;
  String? profileVideoDescription;
  String? profileVideoUrl;
  int? membershipGradeLeaderPoints;
  int? membershipGradeNeededLeaderPoints;
  int? membershipGradePercentAccomplished;
  bool? membershipGradeEligibility;
  dynamic matrixUid;
  dynamic matrixRoomSync;
  bool? allowApiLogin;
  List<dynamic>? savedSearches;
  NextMembershipGrade? nextMembershipGrade;
  CurrentMembershipGrade? currentMembershipGrade;
  List<dynamic>? languages;
  List<dynamic>? badges;
  List<dynamic>? awards;
  List<dynamic>? recommendees;
  List<dynamic>? recommenders;
  List<dynamic>? requestedConnections;
  List<dynamic>? pendingConnections;
  List<dynamic>? approvedConnections;
  List<dynamic>? connectees;
  List<dynamic>? connectors;
  List<dynamic>? userNationalities;
  List<dynamic>? userDesiredLocations;
  List<dynamic>? requestReferences;
  List<dynamic>? requestedReferences;
  List<dynamic>? givenReferences;
  List<dynamic>? receivedReferences;
  List<dynamic>? testimonials;
  List<dynamic>? recommendations;
  List<dynamic>? posts;
  List<dynamic>? likes;
  List<dynamic>? jobApplications;
  List<dynamic>? invites;
  dynamic gender;
  dynamic maritalStatus;
  List<UserTag>? userTags;
  List<Achievement>? achievements;
  List<dynamic>? expertise;
  List<dynamic>? comments;
  List<dynamic>? articles;
  dynamic contactNumberType;
  dynamic currency;
  UserTitleType? userTitleType;
  CompanyRole? companyRole;
  List<Experience>? experiences;
  dynamic currentExperience;
  List<Education>? educations;
  List<dynamic>? userLanguagesProficiencies;
  Country? country;
  Company? company;
  Role? role;
//  List<dynamic>? timeline;
  String? embedSrc;
  String? fullName;
  String? expertiseString;
  String? activeStatus;
  String? avatarCdn;
  String? holedoUrl;

  User({
    this.id,
    this.companyId,
    this.roleId,
    this.companyRoleId,
    this.countryId,
    this.userTitleTypesId,
    this.currencyId,
    this.contactNumberTypesId,
    this.maritalStatusId,
    this.genderId,
    this.currentMembershipGradeId,
    this.nextMembershipGradeId,
    this.slug,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVisibility,
    this.dateOfBirth,
    this.avatar,
    this.banner,
    this.professionalTitle,
    this.area,
    this.contactNumber,
    this.contactNumberVisibility,
    this.contactableWhatsapp,
    this.contactableSms,
    this.website,
    this.websiteVisibility,
    this.skype,
    this.skypeVisibility,
    this.facebook,
    this.facebookVisibility,
    this.twitter,
    this.twitterVisibility,
    this.google,
    this.googleVisibility,
    this.xing,
    this.xingVisibility,
    this.linkedin,
    this.linkedinVisibility,
    this.proxycurlWhodis,
    this.allowRecruiterAccess,
    this.address1,
    this.address2,
    this.addressPostalCode,
    this.addressArea,
    this.workPermits,
    this.relocate,
    this.nextJob,
    this.salaryExpectation,
    this.profileSummary,
    this.active,
    this.profileVideoTitle,
    this.profileVideoDescription,
    this.profileVideoUrl,
    this.membershipGradeLeaderPoints,
    this.membershipGradeNeededLeaderPoints,
    this.membershipGradePercentAccomplished,
    this.membershipGradeEligibility,
    this.matrixUid,
    this.matrixRoomSync,
    this.allowApiLogin,
    this.savedSearches,
    this.nextMembershipGrade,
    this.currentMembershipGrade,
    this.languages,
    this.badges,
    this.awards,
    this.recommendees,
    this.recommenders,
    this.requestedConnections,
    this.pendingConnections,
    this.approvedConnections,
    this.connectees,
    this.connectors,
    this.userNationalities,
    this.userDesiredLocations,
    this.requestReferences,
    this.requestedReferences,
    this.givenReferences,
    this.receivedReferences,
    this.testimonials,
    this.recommendations,
    this.posts,
    this.likes,
    this.jobApplications,
    this.invites,
    this.gender,
    this.maritalStatus,
    this.userTags,
    this.achievements,
    this.expertise,
    this.comments,
    this.articles,
    this.contactNumberType,
    this.currency,
    this.userTitleType,
    this.companyRole,
    this.experiences,
    this.currentExperience,
    this.educations,
    this.userLanguagesProficiencies,
    this.country,
    this.company,
    this.role,
    // this.timeline,
    this.embedSrc,
    this.fullName,
    this.expertiseString,
    this.activeStatus,
    this.avatarCdn,
    this.holedoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        companyId: json['company_id'] as int?,
        roleId: json['role_id'] as int?,
        companyRoleId: json['company_role_id'] as int?,
        countryId: json['country_id'] as int?,
        userTitleTypesId: json['user_title_types_id'] as int?,
        currencyId: json['currency_id'] as dynamic,
        contactNumberTypesId: json['contact_number_types_id'] as dynamic,
        maritalStatusId: json['marital_status_id'] as dynamic,
        genderId: json['gender_id'] as dynamic,
        currentMembershipGradeId: json['current_membership_grade_id'] as int?,
        nextMembershipGradeId: json['next_membership_grade_id'] as int?,
        slug: json['slug'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        emailVisibility: json['email_visibility'] as int?,
        dateOfBirth: json['date_of_birth'] as dynamic,
        avatar: json['avatar'] as String?,
        banner: json['banner'] as String?,
        professionalTitle: json['professional_title'] as String?,
        area: json['area'] as String?,
        contactNumber: json['contact_number'] as String?,
        contactNumberVisibility: json['contact_number_visibility'] as bool?,
        contactableWhatsapp: json['contactable_whatsapp'] as int?,
        contactableSms: json['contactable_sms'] as int?,
        website: json['website'] as dynamic,
        websiteVisibility: json['website_visibility'] as bool?,
        skype: json['skype'] as dynamic,
        skypeVisibility: json['skype_visibility'] as bool?,
        facebook: json['facebook'] as String?,
        facebookVisibility: json['facebook_visibility'] as bool?,
        twitter: json['twitter'] as String?,
        twitterVisibility: json['twitter_visibility'] as bool?,
        google: json['google'] as String?,
        googleVisibility: json['google_visibility'] as bool?,
        xing: json['xing'] as String?,
        xingVisibility: json['xing_visibility'] as bool?,
        linkedin: json['linkedin'] as String?,
        linkedinVisibility: json['linkedin_visibility'] as bool?,
        proxycurlWhodis: json['proxycurl_whodis'] as dynamic,
        allowRecruiterAccess: json['allow_recruiter_access'] as bool?,
        address1: json['address_1'] as dynamic,
        address2: json['address_2'] as dynamic,
        addressPostalCode: json['address_postal_code'] as dynamic,
        addressArea: json['address_area'] as dynamic,
        workPermits: json['work_permits'] as dynamic,
        relocate: json['relocate'] as bool?,
        nextJob: json['next_job'] as dynamic,
        salaryExpectation: json['salary_expectation'] as dynamic,
        profileSummary: json['profile_summary'] as String?,
        active: json['active'] as bool?,
        profileVideoTitle: json['profile_video_title'] as String?,
        profileVideoDescription: json['profile_video_description'] as String?,
        profileVideoUrl: json['profile_video_url'] as String?,
        membershipGradeLeaderPoints:
            json['membership_grade_leader_points'] as int?,
        membershipGradeNeededLeaderPoints:
            json['membership_grade_needed_leader_points'] as int?,
        membershipGradePercentAccomplished:
            json['membership_grade_percent_accomplished'] as int?,
        membershipGradeEligibility:
            json['membership_grade_eligibility'] as bool?,
        matrixUid: json['matrix_uid'] as dynamic,
        matrixRoomSync: json['matrix_room_sync'] as dynamic,
        allowApiLogin: json['allow_api_login'] as bool?,
        savedSearches: json['saved_searches'] as List<dynamic>?,
        nextMembershipGrade: json['next_membership_grade'] == null
            ? null
            : NextMembershipGrade.fromJson(
                json['next_membership_grade'] as Map<String, dynamic>),
        currentMembershipGrade: json['current_membership_grade'] == null
            ? null
            : CurrentMembershipGrade.fromJson(
                json['current_membership_grade'] as Map<String, dynamic>),
        languages: json['languages'] as List<dynamic>?,
        badges: json['badges'] as List<dynamic>?,
        awards: json['awards'] as List<dynamic>?,
        recommendees: json['recommendees'] as List<dynamic>?,
        recommenders: json['recommenders'] as List<dynamic>?,
        requestedConnections: json['requested_connections'] as List<dynamic>?,
        pendingConnections: json['pending_connections'] as List<dynamic>?,
        approvedConnections: json['approved_connections'] as List<dynamic>?,
        connectees: json['connectees'] as List<dynamic>?,
        connectors: json['connectors'] as List<dynamic>?,
        userNationalities: json['user_nationalities'] as List<dynamic>?,
        userDesiredLocations: json['user_desired_locations'] as List<dynamic>?,
        requestReferences: json['request_references'] as List<dynamic>?,
        requestedReferences: json['requested_references'] as List<dynamic>?,
        givenReferences: json['given_references'] as List<dynamic>?,
        receivedReferences: json['received_references'] as List<dynamic>?,
        testimonials: json['testimonials'] as List<dynamic>?,
        recommendations: json['recommendations'] as List<dynamic>?,
        posts: json['posts'] as List<dynamic>?,
        likes: json['likes'] as List<dynamic>?,
        jobApplications: json['job_applications'] as List<dynamic>?,
        invites: json['invites'] as List<dynamic>?,
        gender: json['gender'] as dynamic,
        maritalStatus: json['marital_status'] as dynamic,
        userTags: json['user_tags'] == null
            ? null
            : (json['user_tags'] as List<dynamic>?)
                ?.map((e) => UserTag.fromJson(e as Map<String, dynamic>))
                .toList(),
        achievements: (json['achievements'] as List<dynamic>?)
            ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
            .toList(),
        expertise: json['expertise'] == null
            ? null
            : json['expertise'] as List<dynamic>?,
        comments: json['comments'] == null
            ? null
            : json['comments'] as List<dynamic>?,
        articles: json['articles'] == null
            ? null
            : json['articles'] as List<dynamic>?,
        contactNumberType: json['contact_number_type'] as dynamic,
        currency: json['currency'] as dynamic,
        userTitleType: json['user_title_type'] == null
            ? null
            : UserTitleType.fromJson(
                json['user_title_type'] as Map<String, dynamic>),
        companyRole: json['company_role'] == null
            ? null
            : CompanyRole.fromJson(
                json['company_role'] as Map<String, dynamic>),
        experiences: json['experiences'] == null
            ? null
            : (json['experiences'] as List<dynamic>?)
                ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
                .toList(),
        currentExperience: json['current_experience'] as dynamic,
        educations: json['educations'] == null
            ? null
            : (json['educations'] as List<dynamic>?)
                ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
                .toList(),
        userLanguagesProficiencies: json['user_languages_proficiencies'] == null
            ? null
            : json['user_languages_proficiencies'] as List<dynamic>?,
        country: json['country'] == null
            ? null
            : Country.fromJson(json['country'] as Map<String, dynamic>),
        company: json['company'] == null
            ? null
            : Company.fromJson(json['company'] as Map<String, dynamic>),
        role: json['role'] == null
            ? null
            : Role.fromJson(json['role'] as Map<String, dynamic>),
        /* // timeline: json['timeline'] == null ? null
      //      : json['timeline'] as List<dynamic>?,
      */
        embedSrc: json['embed_src'] as String?,
        fullName: json['full_name'] as String?,
        expertiseString: json['expertise_string'] as String?,
        activeStatus: json['active_status'] as String?,
        avatarCdn: json['avatar_cdn'] as String?,
        holedoUrl: json['holedo_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'company_id': companyId,
        'role_id': roleId,
        'company_role_id': companyRoleId,
        'country_id': countryId,
        'user_title_types_id': userTitleTypesId,
        'currency_id': currencyId,
        'contact_number_types_id': contactNumberTypesId,
        'marital_status_id': maritalStatusId,
        'gender_id': genderId,
        'current_membership_grade_id': currentMembershipGradeId,
        'next_membership_grade_id': nextMembershipGradeId,
        'slug': slug,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'email_visibility': emailVisibility,
        'date_of_birth': dateOfBirth,
        'avatar': avatar,
        'banner': banner,
        'professional_title': professionalTitle,
        'area': area,
        'contact_number': contactNumber,
        'contact_number_visibility': contactNumberVisibility,
        'contactable_whatsapp': contactableWhatsapp,
        'contactable_sms': contactableSms,
        'website': website,
        'website_visibility': websiteVisibility,
        'skype': skype,
        'skype_visibility': skypeVisibility,
        'facebook': facebook,
        'facebook_visibility': facebookVisibility,
        'twitter': twitter,
        'twitter_visibility': twitterVisibility,
        'google': google,
        'google_visibility': googleVisibility,
        'xing': xing,
        'xing_visibility': xingVisibility,
        'linkedin': linkedin,
        'linkedin_visibility': linkedinVisibility,
        'proxycurl_whodis': proxycurlWhodis,
        'allow_recruiter_access': allowRecruiterAccess,
        'address_1': address1,
        'address_2': address2,
        'address_postal_code': addressPostalCode,
        'address_area': addressArea,
        'work_permits': workPermits,
        'relocate': relocate,
        'next_job': nextJob,
        'salary_expectation': salaryExpectation,
        'profile_summary': profileSummary,
        'active': active,
        'profile_video_title': profileVideoTitle,
        'profile_video_description': profileVideoDescription,
        'profile_video_url': profileVideoUrl,
        'membership_grade_leader_points': membershipGradeLeaderPoints,
        'membership_grade_needed_leader_points':
            membershipGradeNeededLeaderPoints,
        'membership_grade_percent_accomplished':
            membershipGradePercentAccomplished,
        'membership_grade_eligibility': membershipGradeEligibility,
        'matrix_uid': matrixUid,
        'matrix_room_sync': matrixRoomSync,
        'allow_api_login': allowApiLogin,
        'saved_searches': savedSearches,
        'next_membership_grade': nextMembershipGrade?.toJson(),
        'current_membership_grade': currentMembershipGrade?.toJson(),
        'languages': languages,
        'badges': badges,
        'awards': awards,
        'recommendees': recommendees,
        'recommenders': recommenders,
        'requested_connections': requestedConnections,
        'pending_connections': pendingConnections,
        'approved_connections': approvedConnections,
        'connectees': connectees,
        'connectors': connectors,
        'user_nationalities': userNationalities,
        'user_desired_locations': userDesiredLocations,
        'request_references': requestReferences,
        'requested_references': requestedReferences,
        'given_references': givenReferences,
        'received_references': receivedReferences,
        'testimonials': testimonials,
        'recommendations': recommendations,
        'posts': posts,
        'likes': likes,
        'job_applications': jobApplications,
        'invites': invites,
        'gender': gender,
        'marital_status': maritalStatus,
        'user_tags': userTags?.map((e) => e.toJson()).toList(),
        'achievements': achievements?.map((e) => e.toJson()).toList(),
        'expertise': expertise,
        'comments': comments,
        'articles': articles,
        'contact_number_type': contactNumberType,
        'currency': currency,
        'user_title_type': userTitleType?.toJson(),
        'company_role': companyRole?.toJson(),
        'experiences': experiences?.map((e) => e.toJson()).toList(),
        'current_experience': currentExperience,
        'educations': educations?.map((e) => e.toJson()).toList(),
        'user_languages_proficiencies': userLanguagesProficiencies,
        'country': country?.toJson(),
        'company': company?.toJson(),
        'role': role?.toJson(),
        //'timeline': timeline,
        /**/
        'embed_src': embedSrc,
        'full_name': fullName,
        'expertise_string': expertiseString,
        'active_status': activeStatus,
        'avatar_cdn': avatarCdn,
        'holedo_url': holedoUrl,
      };
}
