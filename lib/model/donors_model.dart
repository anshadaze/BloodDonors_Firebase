class Donor{
   String? id;
   String? name;
   String? phone;
   String? group;


   Donor({
    required this.id,
    required this.name,
    required this.phone,
    required this.group
   });

   factory Donor.fromMap(Map<String,dynamic>map,String id){
    return Donor(
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