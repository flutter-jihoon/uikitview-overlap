package com.example.uikitview_overlap

import android.annotation.SuppressLint
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.view.LayoutInflater
import android.view.View
import android.widget.TextView
import androidx.core.content.ContextCompat
import io.flutter.plugin.platform.PlatformView

@SuppressLint("InflateParams")
internal class TestNativeView2(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val view: View

    override fun getView(): View {
        return view
    }

    override fun dispose() {}

    init {
        val inflater = LayoutInflater.from(context)
        view = inflater.inflate(R.layout.test_native_view2, null)

        val nativeLabel = view.findViewById<TextView>(R.id.nativeLabel)
        nativeLabel.setOnClickListener {
            viewTapped(context)
        }

        // Extract index from creationParams
        val index = creationParams?.get("index") as? Int ?: 0

        // Set background color based on the index (odd or even)
        if (index % 2 == 0) {
            view.setBackgroundColor(ContextCompat.getColor(context, android.R.color.holo_blue_light)) // Even index
        } else {
            view.setBackgroundColor(ContextCompat.getColor(context, android.R.color.holo_red_light)) // Odd index
        }
    }

    private fun viewTapped(context: Context) {
        val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse("https://www.example.com/2"))
        context.startActivity(browserIntent)
    }
}
