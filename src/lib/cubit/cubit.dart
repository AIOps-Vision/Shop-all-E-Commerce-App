import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './states.dart';
import 'package:sqflite/sqflite.dart';

class ChangeCubit extends Cubit<States> {
  ChangeCubit() : super(InitialState());
  static ChangeCubit get(context) => BlocProvider.of(context);
  bool isPasswordShow = true;
  bool isButtomSheetopened = false;
  IconData butIcon = Icons.edit;

  void bottomSheetOpend({
    required bool ButtomSheetopened,
    required IconData edit,
  }) {
    isButtomSheetopened = ButtomSheetopened;
    butIcon = edit;
    emit(ButtomSheet());
  }

  List<Map> sellerItem = [];
  List<Map> DoneItem = [];
  List<Map> DeletedItem = [];
  //List<List<Map>> all = [sellerItem, DoneItem, DeletedItem];

  late Database database;
  void createDatabase() {
    openDatabase(
      'shope_all.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                'CREATE TABLE allitems(id INTEGER PRIMARY KEY,title TEXT, seller TEXT )')
            .then((value) {})
            .catchError((error) {
          print('error ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(CreateData());
    });
  }

  insertShopDatabase({
    required String title,
    required String time,
    required String date,
    bool check = true,
  }) async {
    await database
        .transaction(
          (txn) => txn
              .rawInsert(
                  'INSERT INTO allitems(title, time,date) VALUES("$title","$time","$date",))')
              .then((value) {
            emit(InsertData());
            getDatabase(
                database); //  print('$value new row inserted successfuly');
          }) //value here is the id of the inserted raw
              .catchError((error) {
            print('error at inseeting new row $error');
          }),
        )
        .toString();
  }

  void getDatabase(database) {
    sellerItem = []; //هنا بتصفر الليسته القديمه عشان متضيفش علي القديم
    DoneItem = [];
    DeletedItem = [];
    emit(GetLoadData());
    database.rawQuery('SELECT *FROM allitems').then((value) {
      //   setState(() {});
      //sellerItem = value;
      value.forEach((element) {
        if (element['status'] == 'new') {
          sellerItem.add(element);
        } else if (element['status'] == 'done') {
          DoneItem.add(element);
        } else
          DeletedItem.add(element);
      });
      emit(GetData());
    });
    ;
  }

  void updateData({required String status, required int id}) async {
    database.rawUpdate(
      'UPDATE allitems SET status=? WHERE id=?',
      ['$status', id],
    ).then((value) {
      getDatabase(database);
      emit(UpdateData());
    });
  }

  void deleteData({required int id}) async {
    database.rawDelete(
      'DELETE FROM allitems WHERE id=?',
      [id],
    ).then((value) {
      getDatabase(database);
      emit(DeleteData());
    });
  }

  static const myList = [
    {
      'head': 'Foods & Drinks Places',
      //'logo': 'assets/images/market.jpg',
      'declare': [
        {
          'branch': 'Jucies',
          'url':
              'https://img.freepik.com/free-photo/colorful-cocktail-with-orange-slice-cocktail-umbrella-green-black-straw_140725-10521.jpg?w=740&t=st=1667384693~exp=1667385293~hmac=412411184e6d1036dd1f4ac2442d379d5cec8d77bcf98a3c2ffb4074acce01d9'
        },
        {
          'branch': 'Restaurants',
          'url':
              'https://img.freepik.com/free-photo/top-view-fast-food-mix-greek-salad-mushroom-pizza-chicken-roll-chocolate-muffins-penne-pasta-cup-coffee-table_141793-3995.jpg?w=826&t=st=1667385952~exp=1667386552~hmac=a57e1e05dd35c7064e5db4903c6b098b58e0326942e9da3ec8b7b3457e9b3d7c'
        },
        {
          'branch': 'Super Markets',
          'url':
              'https://img.freepik.com/premium-photo/supermarket-grocery-table-background-with-cart-food-groceries-blurred-store-shelves-high-qual_90380-2865.jpg'
        },
        {
          'branch': 'Vegetables',
          'url':
              'https://img.freepik.com/free-photo/flat-lay-blackboard-with-fruit-vegetables-reusable-bags_23-2148493508.jpg?t=st=1667387409~exp=1667388009~hmac=4d3f9340180fe0f8f28ef58622611b40ef02a5410b21551da9da73a272864b4e'
        },
        {
          'branch': 'Sweets',
          'url':
              'https://img.freepik.com/free-photo/beautiful-cakes-are-plate-festive-table_8353-9294.jpg?w=740&t=st=1667387145~exp=1667387745~hmac=e7577166ed037f4fdd830d1756bad9246cdc19817f7f7e72b707588327a7c188'
        },
        {
          'branch': 'Bread',
          'url':
              'https://img.freepik.com/free-photo/croissant-cutting-board-with-jam-side-view_176474-8136.jpg?t=st=1667388249~exp=1667388849~hmac=b942eda0f8ee13a670fc3ea55bb611f7eb53d0240afa5460de4bd43727069941'
        },
        {
          'branch': 'Ice Cream',
          'url':
              'https://img.freepik.com/free-photo/tasty-ice-cream-with-urban-background_23-2148289385.jpg?w=740&t=st=1667387633~exp=1667388233~hmac=20ea232182113064b7f4b45e3e077e8d4f4c7bdef79b1f701bd4c6e56c2de215'
        },
        {
          'branch': 'Cafe',
          'url':
              'https://img.freepik.com/free-photo/coffee-time_1122-2867.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Meat',
          'url':
              'https://img.freepik.com/free-photo/coffee-time_1122-2867.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Fish',
          'url':
              'https://img.freepik.com/free-photo/coffee-time_1122-2867.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Chicken',
          'url':
              'https://img.freepik.com/free-photo/coffee-time_1122-2867.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Herbs',
          'url':
              'https://img.freepik.com/free-photo/coffee-time_1122-2867.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
      ],
    },
    {
      'head': 'Health care Places',
      // 'logo': 'assets/images/market.jpg',
      'declare': [
        {
          'branch': 'Pharmacies',
          'url':
              'https://img.freepik.com/free-photo/selection-focus-shot-green-pills-white-surface_181624-862.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Hospitals',
          'url':
              'https://img.freepik.com/free-photo/empty-sad-hospital-bed_23-2149017251.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Doctor Clinic',
          'url':
              'https://img.freepik.com/free-photo/waiting-room-lobby-with-empty-reception-counter-desk-give-help-support-patients-with-consultation-appointments-professional-treatment-space-with-checkup-visits-clinical-exam_482257-50526.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Laboratory',
          'url':
              'https://img.freepik.com/free-photo/flowers-row-testubes-with-different-colored-water-decoration-science-experiment-concept_53876-31955.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Rays',
          'url':
              'https://img.freepik.com/free-photo/neurological-laboratory-with-nobody-it-modernly-equipped-prepared-experiments-development-examining-brain-functions-nervous-system-tomography-scan-scientific-research_482257-13061.jpg?w=826&t=st=1667388950~exp=1667389550~hmac=494df051ea7e6ec5625a3fa4e5a940b07b0295f64cc231ece21189c4681dee66'
        },
        {
          'branch': 'Beauty',
          'url':
              'https://img.freepik.com/free-vector/woman-hairstyle-logo-neon-sign_1262-16232.jpg?w=826&t=st=1667398680~exp=1667399280~hmac=6c783587ec01f2d10a31d3fde1a3e3ba48c48a6a657127fea47a3841127735ef'
        },
        {
          'branch': 'Barbers',
          'url':
              'https://img.freepik.com/free-icon/male-head-hair-beard_318-57831.jpg?size=338&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
      ],
    },
    {
      'head': 'Car Service Places',
      // 'logo': 'assets/images/market.jpg',
      'declare': [
        {
          'branch': 'Services',
          'url':
              'https://img.freepik.com/free-photo/set-work-tools-toolbox_1170-1412.jpg?size=338&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Agent',
          'url':
              'https://img.freepik.com/free-photo/close-up-happy-business-person-car-dealership_23-2149117177.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Rent',
          'url':
              'https://img.freepik.com/free-photo/travel-elements-composition-with-letters_23-2147981842.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Accesories',
          'url':
              'https://img.freepik.com/free-photo/car-elements-details-inside_1303-21770.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
      ],
    },
    {
      'head': 'Clothes Shops Places',
      // 'logo': 'assets/images/market.jpg',
      'declare': [
        {
          'branch': 'mens',
          'url':
              'https://img.freepik.com/free-photo/white-shirts-hanging-room_1303-14667.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'woman',
          'url':
              'https://img.freepik.com/free-photo/swimsuit-yellow-background-isolated_1303-13537.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'childrens',
          'url':
              'https://img.freepik.com/free-photo/pink-baby-concept_23-2147665721.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'shoes',
          'url':
              'https://img.freepik.com/free-photo/shallow-focus-shot-brown-casual-leather-shoes_181624-22142.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Laundry',
          'url':
              'https://img.freepik.com/free-photo/washing-machine-minimal-laundry-room-interior-design_53876-145501.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
      ],
    },
    {
      'head': 'Co_work Spaces Places',
      //'logo': 'assets/images/market.jpg',
      'declare': [
        {
          'branch': 'Companies',
          'url':
              'https://img.freepik.com/free-photo/nobody-business-office-with-computer-instruments-desk-empty-startup-space-used-work-company-growth-with-monitor-equipment-no-people-workplace-with-decorations_482257-32187.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Persons',
          'url':
              'https://img.freepik.com/free-photo/workplace-with-smartphone-coffee-cup-notebook-black-table-top-view_144627-24856.jpg?size=338&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
        {
          'branch': 'Liberary',
          'url':
              'https://img.freepik.com/free-photo/coffee-time_1122-2867.jpg?size=626&ext=jpg&uid=R83144466&ga=GA1.2.455365792.1666877506&semt=ais'
        },
      ],
    },
  ];

  // String val = '';
  // final places = {
  //   '1': 'one',
  //   '2': 'two',
  //   '3': 'three',
  // };
  // final place = {
  //   '1': 'one',
  //   '2': 'two',
  //   '3': 'three',
  // };
  // final plac = {
  //   '1': 'one',
  //   '2': 'two',
  //   '3': 'three',
  // };
  // List<DropdownMenuItem<String>> placesitems = [];
  // void check() {
  //   bool disableDrop = false;
  // }
  // String selectedItem = 'my list item';

  final myListHeads =
      ChangeCubit.myList.map((e) => e['head'].toString()).toList();

  var myDownListHeads0 =
      (ChangeCubit.myList[0]['declare']! as List<Map<String, Object>>)
          .map((e) => e['branch'].toString())
          .toList();
  var myDownListHeads1 =
      (ChangeCubit.myList[1]['declare']! as List<Map<String, Object>>)
          .map((e) => e['branch'].toString())
          .toList();
  var myDownListHeads2 =
      (ChangeCubit.myList[2]['declare']! as List<Map<String, Object>>)
          .map((e) => e['branch'].toString())
          .toList();
  var myDownListHeads3 =
      (ChangeCubit.myList[3]['declare']! as List<Map<String, Object>>)
          .map((e) => e['branch'].toString())
          .toList();
  var myDownListHeads4 =
      (ChangeCubit.myList[4]['declare']! as List<Map<String, Object>>)
          .map((e) => e['branch'].toString())
          .toList();

  // void selectedItemFunction(String element) {
  //   selectedItem = element;
  //   emit(ChoosenItemData(selectedItem));
  // }

  String? select;
  void chooseSelectItem(String newSelect)  {
    emit(ChoosenSelectData(select));
    select = newSelect;

    // return select!;
  }

  String selectedItem = "Category";
  List<String> choosenMyDownListHead = [];
  List<String> checkMyDownList(selectedItem) {
    switch (selectedItem) {
      case "Foods & Drinks Places":
        {
          choosenMyDownListHead = myDownListHeads0;
        }
        break;

      case "Health care Places":
        {
          choosenMyDownListHead = myDownListHeads1;
        }
        break;

      case "Car Service Places":
        {
          choosenMyDownListHead = myDownListHeads2;
        }
        break;

      case "Clothes Shops Places":
        {
          choosenMyDownListHead = myDownListHeads3;
        }
        break;

      case "Co_work Spaces Places":
        {
          choosenMyDownListHead = myDownListHeads4;
        }
        break;
      // default:
      //   {
      //     null;
      //   }
      //   break;
    }
    emit(ChoosenData(selectedItem));
    return choosenMyDownListHead;
  }
}
