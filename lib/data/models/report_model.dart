 class ReportModel{
  final String month;
  final String operatingincome;
  final String otherincome;
  final String netincome;
  final String subcription;
  final String expense;

  ReportModel({required this.month, required this.operatingincome, required this.otherincome, required this.netincome, required this.subcription, required this.expense});
 }

 final List<ReportModel>reportList =[
 ReportModel(month: "Jan", operatingincome: "Rs.35,000", otherincome: "Rs.15,000", netincome: "Rs.50,000", subcription: "Rs.1500", expense: "Rs.17,000"),
 ReportModel(month: "Feb", operatingincome: "Rs.35,000", otherincome: "Rs.20,000", netincome: "Rs.55,000", subcription: "Rs.1500", expense: "Rs.17,200"),
 ReportModel(month: "Mar", operatingincome: "Rs.33,000", otherincome: "Rs.10,000", netincome: "Rs.43,000", subcription: "Rs.1700", expense: "Rs.17,600"),
 ReportModel(month: "Apr", operatingincome: "Rs.35,000", otherincome: "Rs.15,000", netincome: "Rs.50,000", subcription: "Rs.0", expense: "Rs.16,800"),
 ReportModel(month: "May", operatingincome: "Rs.37,000", otherincome: "Rs.18,000", netincome: "Rs.55,000", subcription: "Rs.1500", expense: "Rs.16,300"),
 ReportModel(month: "Jun", operatingincome: "Rs.36,500", otherincome: "Rs.15,000", netincome: "Rs.51,500", subcription: "Rs.1500", expense: "Rs.17,000"),
 ReportModel(month: "Jly", operatingincome: "Rs.35,000", otherincome: "Rs.15,500", netincome: "Rs.50,500", subcription: "Rs.1500", expense: "Rs.17,100"),
 ReportModel(month: "Aug", operatingincome: "Rs.34,500", otherincome: "Rs.17,800", netincome: "Rs.52,200", subcription: "Rs.1200", expense: "Rs.15,700"),
 ReportModel(month: "Sep", operatingincome: "Rs.35,000", otherincome: "Rs.15,000", netincome: "Rs.50,000", subcription: "Rs.1500", expense: "Rs.16,800"),
 ReportModel(month: "Oct", operatingincome: "Rs.35,000", otherincome: "Rs.22,000", netincome: "Rs.57,000", subcription: "Rs.1300", expense: "Rs.15,200"),
 ReportModel(month: "Nov", operatingincome: "Rs.33,100", otherincome: "Rs.21,300", netincome: "Rs.54,400", subcription: "Rs.900", expense: "Rs.14,500"),
 ReportModel(month: "Dec", operatingincome: "Rs.36,700", otherincome: "Rs.15,300", netincome: "Rs.52,000", subcription: "Rs.1100", expense: "Rs.17,000"),
 ];