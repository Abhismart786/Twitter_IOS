package com.example.exam;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.Date;
import java.util.List;

public class CustomerAdapter extends RecyclerView.Adapter<CustomerAdapter.CustomerViewHolder> {
    private List<Customer> customerList;

    public CustomerAdapter(List<Customer> cl) {
        customerList = cl;
    }

    @NonNull
    @Override
    public CustomerViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.customer_item,
                parent, false);
        return new CustomerViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull CustomerViewHolder holder, int position) {
        Customer customer = customerList.get(position);
        holder.nameTextView.setText(customer.getName());
        holder.jobTextView.setText(customer.getJob());
        holder.ageTextView.setText(customer.getAge());

        // Set delete button listener
        holder.deleteButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Remove item from the list and notify adapter
                customerList.remove(holder.getAdapterPosition());
                notifyItemRemoved(holder.getAdapterPosition());
            }
        });
    }

    @Override
    public int getItemCount() {
        return customerList.size();
    }

    public static class CustomerViewHolder extends RecyclerView.ViewHolder {
        public TextView nameTextView;
        public TextView jobTextView;
        public TextView ageTextView;
        public Button deleteButton;
        public Date dateTextView;// Declare delete button

        public CustomerViewHolder(View view) {
            super(view);
            nameTextView = view.findViewById(R.id.textViewName);
            jobTextView = view.findViewById(R.id.textViewJob);
            ageTextView = view.findViewById(R.id.textViewAge);
            deleteButton = view.findViewById(R.id.deleteButton); // Initialize delete button
        }
    }
}