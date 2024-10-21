package com.example.exam;

import android.app.DatePickerDialog;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Patterns;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class CustomeExample extends AppCompatActivity {
    RecyclerView recyclerView;
    CustomerAdapter adapter;
    List<Customer> customers;
    int min = 1;
    int max = 100;
    DatePicker datePicker_one;
    EditText date;
    EditText editTextname, editTextjob,editTextage;
    Button add;
    int result;
    static int getRandomNumber(int max, int min)
    {
        return (int)((Math.random()
                * (max - min)) + min);
    }
    public void makeToast(String str) {
        Toast.makeText(
                        CustomeExample.this,
                        str,
                        Toast.LENGTH_SHORT)
                .show();
    }
    public void clickFunction(View view)
    {
        int userGuessing;
        EditText variable
                = (EditText)findViewById(
                R.id.editId);
        userGuessing
                = Integer.parseInt(
                variable
                        .getText()
                        .toString());
        if (userGuessing < result) {

            makeToast("Think of Higher Number");
        }
        else if (userGuessing > result) {
            makeToast("Think of Lower Number");
        }
        else {
            makeToast(
                    "Congratulations,"
                            +" You Got the Number");
        }
    }
    DatePickerDialog datePickerDialog;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_custome_example);

        recyclerView = findViewById(R.id.recycleview);

        editTextname = findViewById(R.id.name);
        editTextjob = findViewById(R.id.job);
        editTextage = findViewById(R.id.age);
        add = findViewById(R.id.btn1);
        result = getRandomNumber(min, max);

        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        customers = new ArrayList<>();
        // customers.add(new Customer("Full name","JOB ","Age"));
        adapter = new CustomerAdapter(customers);
        recyclerView.setAdapter(adapter);
        setContentView(R.layout.activity_custome_example);
      //  date=(EditText) findViewById(R.id.date);
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        int day = c.get(Calendar.DAY_OF_MONTH);
        date.setOnClickListener(new View.OnClickListener(){
                                    @Override
                                    public void onClick(View view) {
                                         datePickerDialog=new DatePickerDialog(CustomeExample.this, new DatePickerDialog.OnDateSetListener() {
                                            @Override
                                            public void onDateSet(DatePicker datePicker, int i, int i1, int i2) {

                                            }
                                        },year,month,day);
                                         datePickerDialog.show();
                                    }
                                });
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String name = editTextname.getText().toString().trim();
                String job = editTextjob.getText().toString().trim();
                String age = editTextage.getText().toString().trim();




                if (!TextUtils.isEmpty(name)&& !TextUtils.isEmpty(job) && !TextUtils.isEmpty(age) ) {
                    Customer customer = new Customer(name,job,age);
                    customers.add(customer);
                    adapter.notifyDataSetChanged();
                }else {
                    Toast.makeText(CustomeExample.this, "Filled ever",
                            Toast.LENGTH_SHORT).show();
                    return;
                }
                editTextname.setText("");
                editTextjob.setText("");
                editTextage.setText("");
            }
        });
    }
}