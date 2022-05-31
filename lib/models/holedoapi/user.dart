import 'company.dart';
import 'connectee.dart';
import 'connector.dart';
import 'country.dart';
import 'current_membership_grade.dart';
import 'expertise.dart';
import 'given_reference.dart';
import 'job_application.dart';
import 'language.dart';
import 'next_membership_grade.dart';
import 'pending_connection.dart';
import 'request_reference.dart';
import 'requested_connection.dart';
import 'role.dart';
import 'user_languages_proficiency.dart';
import 'user_tag.dart';
import 'user_title_type.dart';

class User {
  String? className;
  int? id;
  int? companyId;
  int? roleId;
  dynamic companyRoleId;
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
  dynamic banner;
  String? professionalTitle;
  String? area;
  String? contactNumber;
  bool? contactNumberVisibility;
  int? contactableWhatsapp;
  int? contactableSms;
  dynamic website;
  dynamic websiteVisibility;
  dynamic skype;
  bool? skypeVisibility;
  dynamic facebook;
  dynamic facebookVisibility;
  dynamic twitter;
  dynamic twitterVisibility;
  dynamic google;
  dynamic googleVisibility;
  dynamic xing;
  dynamic xingVisibility;
  dynamic linkedin;
  dynamic linkedinVisibility;
  dynamic proxycurlWhodis;
  dynamic allowRecruiterAccess;
  dynamic address1;
  dynamic address2;
  dynamic addressPostalCode;
  dynamic addressArea;
  dynamic workPermits;
  dynamic relocate;
  dynamic nextJob;
  dynamic salaryExpectation;
  dynamic profileSummary;
  bool? active;
  String? profileVideoTitle;
  String? profileVideoDescription;
  String? profileVideoUrl;
  int? membershipGradeLeaderPoints;
  int? membershipGradeNeededLeaderPoints;
  int? membershipGradePercentAccomplished;
  bool? membershipGradeEligibility;
  String? matrixUid;
  String? matrixRoomSync;
  bool? allowApiLogin;
  List<dynamic>? savedSearches;
  NextMembershipGrade? nextMembershipGrade;
  CurrentMembershipGrade? currentMembershipGrade;
  List<Language>? languages;
  List<dynamic>? badges;
  List<dynamic>? awards;
  List<dynamic>? recommendees;
  List<dynamic>? recommenders;
  List<RequestedConnection>? requestedConnections;
  List<PendingConnection>? pendingConnections;
  List<dynamic>? approvedConnections;
  List<Connectee>? connectees;
  List<Connector>? connectors;
  List<dynamic>? userNationalities;
  List<dynamic>? userDesiredLocations;
  List<RequestReference>? requestReferences;
  List<dynamic>? requestedReferences;
  List<GivenReference>? givenReferences;
  List<dynamic>? receivedReferences;
  List<dynamic>? testimonials;
  List<dynamic>? recommendations;
  List<dynamic>? posts;
  List<dynamic>? likes;
  List<JobApplication>? jobApplications;
  List<dynamic>? invites;
  Country? country;
  Company? company;
  Role? role;
  dynamic gender;
  dynamic maritalStatus;
  List<UserTag>? userTags;
  List<dynamic>? achievements;
  List<Expertise>? expertise;
  List<dynamic>? comments;
  dynamic contactNumberType;
  dynamic currency;
  UserTitleType? userTitleType;
  dynamic companyRole;
  List<dynamic>? experiences;
  dynamic currentExperience;
  List<dynamic>? educations;
  List<UserLanguagesProficiency>? userLanguagesProficiencies;
  List<dynamic>? timeline;
  String? embedSrc;
  String? fullName;
  String? expertiseString;
  String? activeStatus;
  String? avatarCdn;
  String? holedoUrl;

  User({
    this.className,
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
    this.country,
    this.company,
    this.role,
    this.gender,
    this.maritalStatus,
    this.userTags,
    this.achievements,
    this.expertise,
    this.comments,
    this.contactNumberType,
    this.currency,
    this.userTitleType,
    this.companyRole,
    this.experiences,
    this.currentExperience,
    this.educations,
    this.userLanguagesProficiencies,
    this.timeline,
    this.embedSrc,
    this.fullName,
    this.expertiseString,
    this.activeStatus,
    this.avatarCdn,
    this.holedoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        className: json['__className'] as String?,
        id: json['id'] as int?,
        companyId: json['company_id'] as int?,
        roleId: json['role_id'] as int?,
        companyRoleId: json['company_role_id'] as dynamic,
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
        banner: json['banner'] as dynamic,
        professionalTitle: json['professional_title'] as String?,
        area: json['area'] as String?,
        contactNumber: json['contact_number'] as String?,
        contactNumberVisibility: json['contact_number_visibility'] as bool?,
        contactableWhatsapp: json['contactable_whatsapp'] as int?,
        contactableSms: json['contactable_sms'] as int?,
        website: json['website'] as dynamic,
        websiteVisibility: json['website_visibility'] as dynamic,
        skype: json['skype'] as dynamic,
        skypeVisibility: json['skype_visibility'] as bool?,
        facebook: json['facebook'] as dynamic,
        facebookVisibility: json['facebook_visibility'] as dynamic,
        twitter: json['twitter'] as dynamic,
        twitterVisibility: json['twitter_visibility'] as dynamic,
        google: json['google'] as dynamic,
        googleVisibility: json['google_visibility'] as dynamic,
        xing: json['xing'] as dynamic,
        xingVisibility: json['xing_visibility'] as dynamic,
        linkedin: json['linkedin'] as dynamic,
        linkedinVisibility: json['linkedin_visibility'] as dynamic,
        proxycurlWhodis: json['proxycurl_whodis'] as dynamic,
        allowRecruiterAccess: json['allow_recruiter_access'] as dynamic,
        address1: json['address_1'] as dynamic,
        address2: json['address_2'] as dynamic,
        addressPostalCode: json['address_postal_code'] as dynamic,
        addressArea: json['address_area'] as dynamic,
        workPermits: json['work_permits'] as dynamic,
        relocate: json['relocate'] as dynamic,
        nextJob: json['next_job'] as dynamic,
        salaryExpectation: json['salary_expectation'] as dynamic,
        profileSummary: json['profile_summary'] as dynamic,
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
        matrixUid: json['matrix_uid'] as String?,
        matrixRoomSync: json['matrix_room_sync'] as String?,
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
        languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
            .toList(),
        badges: json['badges'] as List<dynamic>?,
        awards: json['awards'] as List<dynamic>?,
        recommendees: json['recommendees'] as List<dynamic>?,
        recommenders: json['recommenders'] as List<dynamic>?,
        requestedConnections: (json['requested_connections'] as List<dynamic>?)
            ?.map(
                (e) => RequestedConnection.fromJson(e as Map<String, dynamic>))
            .toList(),
        pendingConnections: (json['pending_connections'] as List<dynamic>?)
            ?.map((e) => PendingConnection.fromJson(e as Map<String, dynamic>))
            .toList(),
        approvedConnections: json['approved_connections'] as List<dynamic>?,
        connectees: (json['connectees'] as List<dynamic>?)
            ?.map((e) => Connectee.fromJson(e as Map<String, dynamic>))
            .toList(),
        connectors: (json['connectors'] as List<dynamic>?)
            ?.map((e) => Connector.fromJson(e as Map<String, dynamic>))
            .toList(),
        userNationalities: json['user_nationalities'] as List<dynamic>?,
        userDesiredLocations: json['user_desired_locations'] as List<dynamic>?,
        requestReferences: (json['request_references'] as List<dynamic>?)
            ?.map((e) => RequestReference.fromJson(e as Map<String, dynamic>))
            .toList(),
        requestedReferences: json['requested_references'] as List<dynamic>?,
        givenReferences: (json['given_references'] as List<dynamic>?)
            ?.map((e) => GivenReference.fromJson(e as Map<String, dynamic>))
            .toList(),
        receivedReferences: json['received_references'] as List<dynamic>?,
        testimonials: json['testimonials'] as List<dynamic>?,
        recommendations: json['recommendations'] as List<dynamic>?,
        posts: json['posts'] as List<dynamic>?,
        likes: json['likes'] as List<dynamic>?,
        jobApplications: (json['job_applications'] as List<dynamic>?)
            ?.map((e) => JobApplication.fromJson(e as Map<String, dynamic>))
            .toList(),
        invites: json['invites'] as List<dynamic>?,
        country: json['country'] == null
            ? null
            : Country.fromJson(json['country'] as Map<String, dynamic>),
        company: json['company'] == null
            ? null
            : Company.fromJson(json['company'] as Map<String, dynamic>),
        role: json['role'] == null
            ? null
            : Role.fromJson(json['role'] as Map<String, dynamic>),
        gender: json['gender'] as dynamic,
        maritalStatus: json['marital_status'] as dynamic,
        userTags: (json['user_tags'] as List<dynamic>?)
            ?.map((e) => UserTag.fromJson(e as Map<String, dynamic>))
            .toList(),
        achievements: json['achievements'] as List<dynamic>?,
        expertise: (json['expertise'] as List<dynamic>?)
            ?.map((e) => Expertise.fromJson(e as Map<String, dynamic>))
            .toList(),
        comments: json['comments'] as List<dynamic>?,
        contactNumberType: json['contact_number_type'] as dynamic,
        currency: json['currency'] as dynamic,
        userTitleType: json['user_title_type'] == null
            ? null
            : UserTitleType.fromJson(
                json['user_title_type'] as Map<String, dynamic>),
        companyRole: json['company_role'] as dynamic,
        experiences: json['experiences'] as List<dynamic>?,
        currentExperience: json['current_experience'] as dynamic,
        educations: json['educations'] as List<dynamic>?,
        userLanguagesProficiencies: (json['user_languages_proficiencies']
                as List<dynamic>?)
            ?.map((e) =>
                UserLanguagesProficiency.fromJson(e as Map<String, dynamic>))
            .toList(),
        timeline: json['timeline'] as List<dynamic>?,
        embedSrc: json['embed_src'] as String?,
        fullName: json['full_name'] as String?,
        expertiseString: json['expertise_string'] as String?,
        activeStatus: json['active_status'] as String?,
        avatarCdn: json['avatar_cdn'] as String?,
        holedoUrl: json['holedo_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '__className': className,
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
        'languages': languages?.map((e) => e.toJson()).toList(),
        'badges': badges,
        'awards': awards,
        'recommendees': recommendees,
        'recommenders': recommenders,
        'requested_connections':
            requestedConnections?.map((e) => e.toJson()).toList(),
        'pending_connections':
            pendingConnections?.map((e) => e.toJson()).toList(),
        'approved_connections': approvedConnections,
        'connectees': connectees?.map((e) => e.toJson()).toList(),
        'connectors': connectors?.map((e) => e.toJson()).toList(),
        'user_nationalities': userNationalities,
        'user_desired_locations': userDesiredLocations,
        'request_references':
            requestReferences?.map((e) => e.toJson()).toList(),
        'requested_references': requestedReferences,
        'given_references': givenReferences?.map((e) => e.toJson()).toList(),
        'received_references': receivedReferences,
        'testimonials': testimonials,
        'recommendations': recommendations,
        'posts': posts,
        'likes': likes,
        'job_applications': jobApplications?.map((e) => e.toJson()).toList(),
        'invites': invites,
        'country': country?.toJson(),
        'company': company?.toJson(),
        'role': role?.toJson(),
        'gender': gender,
        'marital_status': maritalStatus,
        'user_tags': userTags?.map((e) => e.toJson()).toList(),
        'achievements': achievements,
        'expertise': expertise?.map((e) => e.toJson()).toList(),
        'comments': comments,
        'contact_number_type': contactNumberType,
        'currency': currency,
        'user_title_type': userTitleType?.toJson(),
        'company_role': companyRole,
        'experiences': experiences,
        'current_experience': currentExperience,
        'educations': educations,
        'user_languages_proficiencies':
            userLanguagesProficiencies?.map((e) => e.toJson()).toList(),
        'timeline': timeline,
        'embed_src': embedSrc,
        'full_name': fullName,
        'expertise_string': expertiseString,
        'active_status': activeStatus,
        'avatar_cdn': avatarCdn,
        'holedo_url': holedoUrl,
      };
}
