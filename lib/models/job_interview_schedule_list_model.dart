class JobInterviewScheduleListModel {
  InterviewSchedules? interviewSchedules;

  JobInterviewScheduleListModel({this.interviewSchedules});

  JobInterviewScheduleListModel.fromJson(Map<String, dynamic> json) {
    interviewSchedules =
        json['interview_schedules'] != null ? new InterviewSchedules.fromJson(json['interview_schedules']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.interviewSchedules != null) {
      data['interview_schedules'] = this.interviewSchedules!.toJson();
    }
    return data;
  }
}

class InterviewSchedules {
  int? currentPage;
  List<String>? data;
  String? firstPageUrl;
  String? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  String? to;
  int? total;

  InterviewSchedules(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  InterviewSchedules.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data = json['data'].cast<String>();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['data'] = this.data;
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}