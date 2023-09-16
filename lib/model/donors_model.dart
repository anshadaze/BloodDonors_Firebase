class DonorModel{
   String? id;
   String? name;
   String? phone;
   String? group;


   DonorModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.group
   });

   factory DonorModel.fromMap(Map<String,dynamic>map,String id){
    return DonorModel(
      id: id,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      group: map['group'] ?? '',
    );
   }


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'group': group,
    };
  }



}