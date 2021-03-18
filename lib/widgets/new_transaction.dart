import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData()
  {

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount<=0){
      return ;
    }

    addTx(enteredTitle,enteredAmount);
  }

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              /*onChanged: (val) {
                      inputTitle = val;
                    }*/
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (val) => inputAmount = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                /*print(titleController.text);
                print(amountController.text);*/
                submitData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
